from django.views.generic import TemplateView
from django.shortcuts import render, redirect, reverse
from django.contrib.auth.models import User

from accounts.forms import RegistrationForm, EditProfileForm
from accounts.models import UserProfile

class ViewProfileView(TemplateView):
    template_name = 'accounts/view_profile.html'

    def get(self, request, pk=None):
        if pk:
            user = User.objects.get(pk=pk)
        else:
            user = request.user

        return render(request, self.template_name, {'user': user})


class EditProfileView(TemplateView):
    template_name = 'accounts/edit_profile.html'

    def get(self, request):
        form = EditProfileForm()
        args = {'form': form}

        return render(request, self.template_name, args)

    def post(self, request):
        form = EditProfileForm(request.POST)

        if form.is_valid():
            userpro = UserProfile.objects.get(pk=request.user.userprofile.pk)
            userpro.age = form.cleaned_data['age']
            userpro.city = form.cleaned_data['city']

            user = User.objects.get(pk = request.user.pk)
            user.last_name = form.cleaned_data['last_name']
            user.first_name = form.cleaned_data['first_name']
            user.email = form.cleaned_data['email']
            user.save()
            userpro.save()
        return redirect(reverse('accounts:view_profile'))

class RegisterView(TemplateView):
    template_name = 'accounts/reg_form.html'

    def get(self, request):
        form = RegistrationForm()
        args = {'form': form}

        return render(request, self.template_name, args)

    def post(self, request):
        form = RegistrationForm(request.POST)

        if form.is_valid():
            form.save()
            return redirect(reverse('talk:info'))
        else:
            args = {'form': form}
            return render(request, self.template_name, args)

