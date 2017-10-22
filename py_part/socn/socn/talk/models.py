from django.db import models
from django.contrib.auth.models import User

class Friend(models.Model):
    users = models.ManyToManyField(User)
    current_user = models.ForeignKey(User, related_name = 'owner', null = True)

    @classmethod
    def make_friend(cls, current_user, new_friend):
        friend, created = cls.objects.get_or_create\
        (
            current_user = current_user
        )
        friend.users.add(new_friend)

    
    @classmethod
    def lose_friend(cls, current_user, new_friend):
        friend, created = cls.objects.get_or_create\
        (
            current_user = current_user
        )
        friend.users.remove(new_friend)


class Message(models.Model):
    sender = models.ForeignKey(User)
    receiver = models.ForeignKey(User, related_name = 'receiver')
    text = models.CharField(max_length = 500)
    read = models.BooleanField()
    date = models.DateTimeField(auto_now_add = True)

    def __str__(self):
        return str(self.sender) + " -> " + str(self.receiver)






    
