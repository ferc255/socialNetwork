from django.shortcuts import render
from django.views.generic import TemplateView
from django.http import JsonResponse, HttpResponse
import json
from django.views.decorators.csrf import csrf_exempt

class SnakeView(TemplateView):
    template_name = 'games/snake.html'
    def get(self, request):
        return render(request, self.template_name);

class Tic5View(TemplateView):
    template_name = 'games/tic5.html'
    def get(self, request):
        return render(request, self.template_name);

@csrf_exempt
def myapi(request, item):
    if (item == 'username'):
        #print('--yes, the treatment to api was fixed--')
        data = {'username': str(request.user)}
        #response = HttpResponse(json.dumps(data))
        response = JsonResponse(data)
        response["Access-Control-Allow-Origin"] = "http://127.0.0.1:2000"
        response["Access-Control-Allow-Methods"] = "POST, GET, OPTIONS"
        response["Access-Control-Max-Age"] = "1000"
        response["Access-Control-Allow-Headers"] = "*"
        response["Access-Control-Allow-Credentials"] = "true"
        return response
    elif item == 'winner':
        winner = json.loads(request.body.decode())['username']
        print(winner)
        response = JsonResponse({'status': 'OK'})
        response["Access-Control-Allow-Origin"] = "http://127.0.0.1:2000"
        response["Access-Control-Allow-Methods"] = "POST, GET, OPTIONS"
        response["Access-Control-Max-Age"] = "1000"
        response["Access-Control-Allow-Headers"] = "*"
        response["Access-Control-Allow-Credentials"] = "true"
        return response
                        
                            
