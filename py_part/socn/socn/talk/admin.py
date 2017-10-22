from django.contrib import admin

from socn.talk.models import Friend, Message

# Register your models here.
admin.site.register(Friend)
admin.site.register(Message)
