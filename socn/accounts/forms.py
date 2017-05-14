from django import forms
from django.contrib.auth.models import User
from django.contrib.auth.forms import UserCreationForm, UserChangeForm
from accounts.models import UserProfile

class RegistrationForm(UserCreationForm):
    email = forms.EmailField(required = True)

    class Meta:
        model = User
        fields = \
        (
            'username',
            'first_name',
            'last_name',
            'email',
            'password1',
            'password2',
        )

    def save(self, commit = True):
        user = super(RegistrationForm, self).save(commit = False)
        user.first_name = self.cleaned_data['first_name']
        user.last_name = self.cleaned_data['last_name']
        user.email = self.cleaned_data['email']

        if commit:
            user.save()

        return user

class EditProfileForm(forms.Form):
    first_name = forms.CharField()
    last_name = forms.CharField()
    email = forms.EmailField()
    age = forms.IntegerField()
    city = forms.CharField()
    
        
"""
class EditProfileForm(UserChangeForm):
    age = forms.IntegerField()
    city = forms.CharField(max_length = 100)
    
    class Meta:
        model = User
        fields = \
        (
            'first_name',
            'last_name',
            'email',
            'age',
            'city',
        )
        exclude = ('password',)

    def save(self, commit = True):
        user = super(EditProfileForm, self).save(commit = False)
        user.first_name = self.cleaned_data['first_name']
        user.last_name = self.cleaned_data['last_name']
        user.email = self.cleanded_data['email']
        user.userprofile.age = self.cleaned_data['age']

        if commit:
            user.save()

        return user
"""
