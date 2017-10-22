from django.conf.urls import url
from socn.games import views
from django.views.generic import TemplateView

urlpatterns = \
[
    url(r'^snake/$', views.SnakeView.as_view(), name = 'snake'),
    url(r'^tic5/$', views.Tic5View.as_view(), name = 'tic5'),
    url(r'^nst/$', TemplateView.as_view(template_name='nst.html'), name = 'nst'),
]


              
