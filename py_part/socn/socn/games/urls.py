from django.conf.urls import url
from socn.games import views
from django.views.generic import TemplateView


urlpatterns = \
[
    url(r'^ranklist/$', views.ranklist, name = 'ranklist'),
    url(r'^myapi_(?P<item>[a-z0-9]+)/$', views.myapi, name = 'myapi'),
]


              
