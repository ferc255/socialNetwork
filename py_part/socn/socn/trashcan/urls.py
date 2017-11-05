from django.conf.urls import url
from socn.trashcan import views


urlpatterns = [
    url(r'^$', views.scroll, name = 'scroll'),
    url(r'^snake$', views.snake, name = 'snake'),
    url(r'^tic5$', views.tic5, name = 'tic5'),
]
