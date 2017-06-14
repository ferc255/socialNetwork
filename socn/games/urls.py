from django.conf.urls import url
from games import views

urlpatterns = \
[
    url(r'^snake/$', views.SnakeView.as_view(), name = 'snake'),
]
              
