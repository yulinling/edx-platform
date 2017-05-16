# -*- coding: utf-8 -*-
""" Tests for the language API. """

from mock import patch
from django.test import TestCase
from django.test.utils import override_settings
from django.utils import translation
from django.contrib.auth.models import User
import ddt

from openedx.core.djangoapps.dark_lang.models import DarkLangConfig
from openedx.core.djangoapps.lang_pref import api as language_api
from openedx.core.djangoapps.site_configuration.tests.test_util import with_site_configuration_context

EN = language_api.Language('en', 'English')
ES_419 = language_api.Language('es-419', u'Español (Latinoamérica)')


@ddt.ddt
class LanguageApiTest(TestCase):
    """
    Tests of the language APIs.
    """

    @ddt.data(
        # Should return base config
        (
            {'LANGUAGE_SELECTOR': {'HEADER': False, 'FOOTER': False}},
            {},
            {},
            {'HEADER': False, 'FOOTER': False}
        ),

        # SHOW_LANGUAGE_SELECTOR base config setting should supercede HEADER setting if True
        (
            {'LANGUAGE_SELECTOR': {'HEADER': False, 'FOOTER': False}, 'SHOW_LANGUAGE_SELECTOR': True},
            {},
            {},
            {'HEADER': True, 'FOOTER': False}
        ),

        # SHOW_LANGUAGE_SELECTOR base config setting should not supercede HEADER setting if False
        (
            {'LANGUAGE_SELECTOR': {'HEADER': True, 'FOOTER': False}, 'SHOW_LANGUAGE_SELECTOR': False},
            {},
            {},
            {'HEADER': True, 'FOOTER': False}
        ),

        # Site config settings should supercede base config
        (
            {'LANGUAGE_SELECTOR': {'HEADER': False, 'FOOTER': False}},
            {'LANGUAGE_SELECTOR': {'FOOTER': True}},
            {},
            {'HEADER': False, 'FOOTER': True}
        ),

        # SHOW_LANGUAGE_SELECTOR site config setting should supercede HEADER setting if True
        (
            {'LANGUAGE_SELECTOR': {'HEADER': False, 'FOOTER': False}},
            {'SHOW_LANGUAGE_SELECTOR': True},
            {},
            {'HEADER': True, 'FOOTER': False}
        ),

        # SHOW_LANGUAGE_SELECTOR site config setting should not supercede HEADER setting if False
        (
            {'LANGUAGE_SELECTOR': {'HEADER': True, 'FOOTER': False}},
            {'SHOW_LANGUAGE_SELECTOR': False},
            {},
            {'HEADER': True, 'FOOTER': False}
        ),

        # Overrides should supercede all other config settings
        (
            {'LANGUAGE_SELECTOR': {'HEADER': False, 'FOOTER': False}, 'SHOW_LANGUAGE_SELECTOR': True},
            {'LANGUAGE_SELECTOR': {'FOOTER': True}},
            {'FOOTER': False, 'HEADER': False},
            {'HEADER': False, 'FOOTER': False}
        ),
    )
    @ddt.unpack
    def test_language_selector_config(self, base_config, site_config, overrides, expected_config):
        """
        Verify that the language selector config is correct.
        """
        with patch.dict('django.conf.settings.FEATURES', base_config):
            with with_site_configuration_context(configuration=site_config):
                self.assertEqual(language_api.language_selector_config(overrides), expected_config)

    @ddt.data(*[
        ('en', [], [], []),
        ('en', [EN], [], [EN]),
        ('en', [EN, ES_419], [], [EN]),
        ('en', [EN, ES_419], ['es-419'], [EN, ES_419]),
        ('es-419', [EN, ES_419], ['es-419'], [ES_419]),
        ('en', [EN, ES_419], ['es'], [EN]),
    ])
    @ddt.unpack
    def test_released_languages(self, default_lang, languages, dark_lang_released, expected_languages):
        """
        Tests for the released languages.
        """
        with override_settings(LANGUAGES=languages, LANGUAGE_CODE=default_lang):
            user = User()
            user.save()
            DarkLangConfig(
                released_languages=', '.join(dark_lang_released),
                changed_by=user,
                enabled=True
            ).save()
            released_languages = language_api.released_languages()
            self.assertEqual(released_languages, expected_languages)

    @override_settings(ALL_LANGUAGES=[[u"cs", u"Czech"], [u"nl", u"Dutch"]])
    def test_all_languages(self):
        """
        Tests for the list of all languages.
        """
        with translation.override('fr'):
            all_languages = language_api.all_languages()

        self.assertEqual(2, len(all_languages))
        self.assertLess(all_languages[0][1], all_languages[1][1])
        self.assertEqual("nl", all_languages[0][0])
        self.assertEqual("cs", all_languages[1][0])
        self.assertEqual(u"Hollandais", all_languages[0][1])
        self.assertEqual(u"Tchèque", all_languages[1][1])
