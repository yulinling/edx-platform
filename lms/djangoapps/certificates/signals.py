""" Signal handler for enabling self-generated certificates for self-paced
courses and disabling for instructor-paced courses.
"""
from celery.task import task
from django.dispatch.dispatcher import receiver
from opaque_keys.edx.keys import CourseKey
from certificates.models import CertificateGenerationCourseSetting
from xmodule.modulestore.django import SignalHandler, modulestore


@receiver(SignalHandler.course_published)
def _listen_for_course_publish(sender, course_key, **kwargs):  # pylint: disable=unused-argument
    """ Catches the signal that a course has been published in Studio and
    enable/disable the self-generated certificates for courses according to pacing.
    """
    set_self_generated_certs.delay(unicode(course_key))


@task()
def set_self_generated_certs(course_key):
    """Enable or disable self-generated certificates for a course according to pacing."""
    course_key = CourseKey.from_string(course_key)
    course = modulestore().get_course(course_key)
    CertificateGenerationCourseSetting.set_enabled_for_course(course_key, course.self_paced)
