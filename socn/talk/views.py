from django.shortcuts import render, redirect, reverse
from django.views.generic import TemplateView
from django.contrib.auth.models import User

from talk.models import Friend, Message
from talk.forms import MessageForm

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


class DialogView(TemplateView):
    template_name = 'talk/dialog.html'

    def get(self, request, pk):
        form = MessageForm()
        friend = User.objects.get(pk = pk)
        messages = Message.objects.filter\
            (
                sender = request.user,
                receiver = friend,
            )\
        	|\
        	Message.objects.filter\
            (
                receiver = request.user,
                sender = friend,
            )

        messages = messages.order_by("-date")
        args = {'messages': list(messages), 'form': form, 'friend': friend}

        Message.objects.filter\
            (
                receiver = request.user,
                sender = friend,
            ).update(read=True)
        return render(request, self.template_name, args)

    def post(self, request, pk):
        form = MessageForm(request.POST)
        friend = User.objects.get(pk = pk)

        if form.is_valid():
            message = Message()
            message.sender = request.user
            message.receiver = friend
            message.read = False
            message.text = form.cleaned_data['message']
            message.save()
        return redirect(reverse('talk:dialog', kwargs={'pk': pk}))
