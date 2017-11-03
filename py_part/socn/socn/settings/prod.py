from socn.settings.base import *

DEBUG = False

ALLOWED_HOSTS = [
    'tuna.com.ru',
    'www.tuna.com.ru',
]

DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.postgresql_psycopg2',
        'NAME': 'socn',
        'USER': 'alexsql',
        'PASSWORD': '1234',
        'HOST': 'localhost',
        'PORT': '',
    }
}
