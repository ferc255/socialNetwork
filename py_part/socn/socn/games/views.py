from django.shortcuts import render
from django.views.generic import TemplateView
from django.http import JsonResponse, HttpResponse
import json


class SnakeView(TemplateView):
    template_name = 'games/snake.html'
    def get(self, request):
        return render(request, self.template_name);

class Tic5View(TemplateView):
    template_name = 'games/tic5.html'
    def get(self, request):
        return render(request, self.template_name);

def myapi(request, item):
    #print(dir(request.session)) ///////////////////////// data check
    if (item == 'username'):
        data = {'username': str(request.user)}
        #response = HttpResponse(json.dumps(data))
        response = JsonResponse(data)
        response["Access-Control-Allow-Origin"] = "http://127.0.0.1:2000"
        response["Access-Control-Allow-Methods"] = "POST, GET, OPTIONS"
        response["Access-Control-Max-Age"] = "1000"
        response["Access-Control-Allow-Headers"] = "*"
        response["Access-Control-Allow-Credentials"] = "true"
        return response

                        
                            
