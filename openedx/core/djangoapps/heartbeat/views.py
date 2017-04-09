"""
Views for verifying the health (heartbeat) of the app.
"""
from dogapi import dog_stats_api
from util.json_request import JsonResponse

from .checks import checks

@dog_stats_api.timed('edxapp.heartbeat')
def heartbeat(request):  # pylint: disable=unused-argument
    """
    Simple view that a loadbalancer can check to verify that the app is up. Returns a json doc
    of service id: status or message. If the status for any service is anything other than True,
    it returns HTTP code 503 (Service Unavailable); otherwise, it returns 200.
    """
    check_results = {}
    try:
        check_results = checks(request)

        status_code = 200 # Default to OK
        for check in check_results:
            if(check_results[check]['status'] == False):
                status_code = 503 # 503 on any failure
    except Exception as e:
        status_code = 503
        check_results = {'error': unicode(e)}

    return JsonResponse(check_results, status=status_code)
