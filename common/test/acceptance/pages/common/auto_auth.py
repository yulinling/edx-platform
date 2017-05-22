"""
Auto-auth page (used to automatically log in during testing).
"""
import json
import urllib

import os
from bok_choy.page_object import PageObject, unguarded, XSS_INJECTION

# The URL used for user auth in testing
AUTH_BASE_URL = os.environ.get('test_url', 'http://localhost:8031')


class AutoAuthPage(PageObject):
    """
    The automatic authorization page.
    When allowed via the django settings file, visiting
    this url will create a user and log them in.
    """

    def __init__(self, browser, username=None, email=None, password=None, full_name=None, staff=None, course_id=None,
                 enrollment_mode=None, roles=None, is_active=None):
        """
        Auto-auth is an end-point for HTTP GET requests.
        By default, it will create accounts with random user credentials,
        but you can also specify credentials using querystring parameters.

        `username`, `email`, and `password` are the user's credentials (strings)
        'full_name' is the profile full name value
        `staff` is a boolean indicating whether the user is global staff.
        `course_id` is the ID of the course to enroll the student in.
        Currently, this has the form "org/number/run"

        Note that "global staff" is NOT the same as course staff.
        """
        super(AutoAuthPage, self).__init__(browser)

        # This will eventually hold the details about the user account
        self._user_info = None

        # Create query string parameters if provided
        self._params = {}

        if username is not None:
            self._params['username'] = username

        self._params['full_name'] = full_name if full_name is not None else XSS_INJECTION

        if email is not None:
            self._params['email'] = email

        if password is not None:
            self._params['password'] = password

        if staff is not None:
            self._params['staff'] = "true" if staff else "false"

        if course_id is not None:
            self._params['course_id'] = course_id
            if enrollment_mode:
                self._params['enrollment_mode'] = enrollment_mode

        if roles is not None:
            self._params['roles'] = roles

        if is_active is not None:
            self._params['is_active'] = "true" if is_active else "false"

    @property
    def url(self):
        """
        Construct the URL.
        """
        url = AUTH_BASE_URL + "/auto_auth"
        query_str = urllib.urlencode(self._params)

        if query_str:
            url += "?" + query_str

        return url

    def is_browser_on_page(self):
        return True if self.get_user_info() is not None else False

    @unguarded
    def get_user_info(self):
        """Parse the auto auth page body to extract relevant details about the user that was logged in."""
        body = self.q(css='BODY').text[0]
        return json.loads(body)

    @property
    def user_info(self):
        """A dictionary containing details about the user account."""
        if self._user_info is None:
            user_info = self.get_user_info()
            if user_info is not None:
                self._user_info = self.get_user_info()
        return self._user_info

    def get_user_id(self):
        """
        Finds and returns the user_id
        """
        return self.user_info['user_id']
