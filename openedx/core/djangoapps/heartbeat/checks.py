from importlib import import_module

from django.conf import settings
from django.core.exceptions import ImproperlyConfigured

from .defaults import *

def checks(request):
    """
    Iterates through a tuple of systems checks,
    then returns a key name for the check and the value
    for that check.
    """
    response_dict = {}

    #Taken straight from Django
    #If there is a better way, I don't know it
    for path in getattr(settings, 'HEARTBEAT_CHECKS', HEARTBEAT_DEFAULT_CHECKS):
            i = path.rfind('.')
            module, attr = path[:i], path[i+1:]
            try:
                mod = import_module(module)
            except ImportError as e:
                raise ImproperlyConfigured('Error importing module %s: "%s"' % (module, e))
            try:
                func = getattr(mod, attr)
            except AttributeError:
                raise ImproperlyConfigured('Module "%s" does not define a "%s" callable' % (module, attr))

            check_name, is_ok, message = func(request)
            response_dict[check_name] =  {
                'status': is_ok,
                'message': message
            }

    return response_dict

#DEFAULT SYSTEM CHECKS

#Modulestore

def check_modulestore(request):
    from xmodule.modulestore.django import modulestore
    from xmodule.exceptions import HeartbeatFailure
    # This refactoring merely delegates to the default modulestore (which if it's mixed modulestore will
    # delegate to all configured modulestores) and a quick test of sql. A later refactoring may allow
    # any service to register itself as participating in the heartbeat. It's important that all implementation
    # do as little as possible but give a sound determination that they are ready.
    try:
        #@TODO Do we want to parse the output for split and mongo detail and return it?
        modulestore().heartbeat()
        return 'modulestore', True, "OK"
    except HeartbeatFailure as fail:
        return 'modulestore', False, str(fail)

def check_database(request):
    from django.db import connection
    from django.db.utils import DatabaseError
    cursor = connection.cursor()
    try:
        cursor.execute("SELECT CURRENT_DATE")
        cursor.fetchone()
        return 'sql', True, str("OK")
    except DatabaseError as fail:
        return 'sql', False, str(fail)


#Caching
CACHE_KEY = 'heartbeat-test'
CACHE_VALUE = 'abc123'

def check_cache_set(request):
    from django.core.cache import cache
    try:
        cache.set(CACHE_KEY, CACHE_VALUE, 30)
        return 'cache_set', True
    except:
        return 'cache_set', False

def check_cache_get(request):
    from django.core.cache import cache
    try:
        data = cache.get(CACHE_KEY)
        if data == CACHE_VALUE:
            return 'cache_get', True
        else:
            return 'cache_get', False
    except:
        return 'cache_get', False


#User
def check_user_exists(request):
    from django.contrib.auth.models import User
    try:
        username = request.GET.get('username')
        u = User.objects.get(username=username)
        return 'user_exists', True
    except:
        return 'user_exists', False


#Celery
def check_celery(request):
    from datetime import datetime, timedelta
    from time import sleep, time
    from heartbeat.tasks import sample_task

    now = time()
    datetimenow = datetime.now()
    expires = datetimenow + timedelta(seconds=getattr(settings, 'PING_CELERY_TIMEOUT', PING_CELERY_TIMEOUT))

    try:
        task = sample_task.apply_async(expires=expires)
        while expires > datetime.now():
            if task.ready() and task.result == True:
                finished = str(time() - now)
                return 'celery', { 'success': True, 'time':finished }
            sleep(0.25)
        return 'celery', { 'success': False }
    except Exception:
        return 'celery', { 'success': False }
