from django.shortcuts import render
from django.views.generic import TemplateView
from django.http import JsonResponse, HttpResponse
from django.contrib.auth.models import User
import json
from django.views.decorators.csrf import csrf_exempt


def ranklist(request):
    data = {'users': User.objects.all()}
    return render(request, 'games/ranklist.html', data)


def cors_response(data):
    response = JsonResponse(data)
    response["Access-Control-Allow-Origin"] = "http://127.0.0.1:2000"
    response["Access-Control-Allow-Methods"] = "POST, GET, OPTIONS"
    response["Access-Control-Max-Age"] = "1000"
    response["Access-Control-Allow-Headers"] = "*"
    response["Access-Control-Allow-Credentials"] = "true"
    return response
    

@csrf_exempt
def myapi(request, item):        
    if (item == 'username'):
        data = {'username': str(request.user)}
        
        return cors_response(data)
    elif item == 'winner':
        winner_name = json.loads(request.body.decode())['username']
        winner_obj = User.objects.get(username=winner_name)
        winner_obj.userprofile.score += 1
        winner_obj.userprofile.save()
        
        return cors_response({'status': 'OK'})

                        
                            
