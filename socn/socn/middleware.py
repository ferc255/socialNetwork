from django.shortcuts import redirect, reverse
from django.conf import settings
import re

ANON_URLS = []
if hasattr(settings, 'ANON_URLS'):
    ANON_URLS += [re.compile(url) for url in settings.ANON_URLS]

LOGIN_EXEMPT_URLS = []
if hasattr(settings, 'LOGIN_EXEMPT_URLS'):
    LOGIN_EXEMPT_URLS += \
        [re.compile(url) for url in settings.LOGIN_EXEMPT_URLS]



class LoginRequiredMiddleware:
    def __init__(self, get_response):
        self.get_response = get_response

    def __call__(self, request):
        response = self.get_response(request)
        return response

    def process_view(self, request, view_func, view_args, view_kwargs):
        path = request.path_info.lstrip('/')
        for_anon = any(url.match(path) for url in ANON_URLS)
        login_exempt = any(url.match(path) for url in LOGIN_EXEMPT_URLS)

        

        if not request.user.is_authenticated and not for_anon:
            return redirect(reverse('accounts:login'))
        elif request.user.is_authenticated and login_exempt:
            return redirect(reverse('accounts:view_profile'))
        else:
            return None
