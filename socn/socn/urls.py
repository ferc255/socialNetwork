from django.conf.urls import url, include
from django.contrib import admin

urlpatterns = \
[
    url(r'^admin/', admin.site.urls),
    url(r'^account/', include('accounts.urls', namespace = 'accounts')),
    url(r'^', include('talk.urls', namespace = 'talk')),
    url(r'^game/', include('games.urls', namespace = 'games')),
]
