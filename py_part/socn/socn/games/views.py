from django.shortcuts import render
from django.views.generic import TemplateView
from django.http import JsonResponse, HttpResponse
from django.contrib.auth.models import User
import json
from django.views.decorators.csrf import csrf_exempt


def ranklist(request):
    data = {'users': User.objects.all()}
    return render(request, 'games/ranklist.html', data)


def get_addr(request):
    client = request.META.get('HTTP_X_FORWARD_FOR')
    if client:
        return client.split(',')[0]
    else:
        return request.META.get('HTTP_ORIGIN')
    

@csrf_exempt
def myapi(request, item):    
    good_address_list = ['http://127.0.0.1:2000', 'http://tuna.com.ru:2000']
    
    if (item == 'username'):
        #print('--yes, the treatment to api was fixed--')
        data = {'username': str(request.user)}
        #response = HttpResponse(json.dumps(data))
        response = JsonResponse(data)
        #response["Access-Control-Allow-Origin"] = "http://tuna.com.ru:2000, http://127.0.0.1:2000"
        #response["Access-Control-Allow-Origin"] = "http://127.0.0.1:2000"
        response["Access-Control-Allow-Origin"] = "http://127.0.0.1:2000"
        # print(request.META)
        #for i in request.META:
        #    print(i, request.META[i])
        print(get_addr(request))
        client = get_addr(request)
        response["Access-Control-Allow-Methods"] = "POST, GET, OPTIONS"
        response["Access-Control-Max-Age"] = "1000"
        response["Access-Control-Allow-Headers"] = "*"
        response["Access-Control-Allow-Credentials"] = "true"
        return response
    elif item == 'winner':
        winner_name = json.loads(request.body.decode())['username']
        winner_obj = User.objects.get(username=winner_name)
        winner_obj.userprofile.score += 1
        winner_obj.userprofile.save()
        print(winner_obj.userprofile.score, 2)
        response = JsonResponse({'status': 'OK'})
        response["Access-Control-Allow-Origin"] = "http://127.0.0.1:2000"
        response["Access-Control-Allow-Methods"] = "POST, GET, OPTIONS"
        response["Access-Control-Max-Age"] = "1000"
        response["Access-Control-Allow-Headers"] = "*"
        response["Access-Control-Allow-Credentials"] = "true"
        return response

                        
                            
