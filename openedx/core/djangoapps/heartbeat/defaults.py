HEARTBEAT_DEFAULT_CHECKS = [
    '.checks.check_modulestore',
    '.checks.check_database',
]

HEARTBEAT_EXTENDED_DEFAULT_CHECKS = (
    '.checks.check_celery',
)

HEARTBEAT_CELERY_TIMEOUT = 5
