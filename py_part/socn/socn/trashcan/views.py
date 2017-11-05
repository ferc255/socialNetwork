from django.shortcuts import render

# Create your views here.
def scroll(request):
    return render(request, 'trashcan/scroll.html')

def snake(request):
    return render(request, 'trashcan/snake.html')

def tic5(request):
    return render(request, 'trashcan/tic5.html')
