from django.shortcuts import render, redirect, reverse
from django.views.generic import TemplateView
from django.contrib.auth.models import User

from talk.models import Friend

class InfoView(TemplateView):
    template_name = 'talk/info.html'

class FriendsView(TemplateView):
    template_name = 'talk/friends.html'

    def get(self, request):
        users = User.objects.all().exclude(pk=request.user.pk)
        friends = Friend.objects.get(current_user = request.user).users.all()

        args = {'users': users, 'friends': friends}
        return render(request, self.template_name, args)


class ConnectView(TemplateView):
    def get(self, request, operation, pk):
        friend = User.objects.get(pk=pk)
        if operation == 'add':
            Friend.make_friend(request.user, friend)
        elif operation == 'remove':
            Friend.lose_friend(request.user, friend)
        return redirect(reverse('talk:friends'))
