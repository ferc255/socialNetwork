from django.conf.urls import url
from socn.talk import views

urlpatterns = \
[
    url(r'^$', views.InfoView.as_view(), name = 'info'),
    url(r'^friends/$', views.FriendsView.as_view(), name = 'friends'),
    url(r'^connect/(?P<operation>.+)/(?P<pk>\d+)/$',
        views.ConnectView.as_view(), name = 'connect'),
    url(r'^dialog/(?P<pk>\d+)/$', views.DialogView.as_view(),
        name = 'dialog'),
    url(r'^messages/$', views.MessagesView.as_view(), name = 'messages'),
]
