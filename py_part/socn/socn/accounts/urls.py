from django.conf.urls import url
from . import views

from django.contrib.auth.views import \
(
    login, logout,
)

urlpatterns = \
[
    url(r'^login/$', login, {'template_name': 'accounts/login.html'},
        name = 'login'),
    url(r'^logout/$', logout, {'template_name': 'accounts/logout.html'},
        name = 'logout'),
    url(r'^profile/$', views.ViewProfileView.as_view(), name = 'view_profile'),
    url(r'^profile/(?P<pk>\d+)/$', views.ViewProfileView.as_view(),
        name = 'view_profile'),
    url(r'^profile/edit/$', views.EditProfileView.as_view(),
        name = 'edit_profile'),
    url(r'^register/$', views.RegisterView.as_view(), name = 'register'),
]
