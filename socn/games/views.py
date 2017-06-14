from django.shortcuts import render
from django.views.generic import TemplateView


class SnakeView(TemplateView):
    template_name = 'games/snake.html'
    def get(self, request):
        return render(request, self.template_name);

class Tic5View(TemplateView):
    template_name = 'games/tic5.html'
    def get(self, request):
        return render(request, self.template_name);



                        
                            
