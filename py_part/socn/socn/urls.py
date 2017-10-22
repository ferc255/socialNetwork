from django.conf.urls import url, include
from django.contrib import admin

urlpatterns = \
[
    url(r'^admin/', admin.site.urls),
    url(r'^account/', include('socn.accounts.urls', namespace = 'accounts')),
    url(r'^', include('socn.talk.urls', namespace = 'talk')),
    url(r'^game/', include('socn.games.urls', namespace = 'games')),
]
