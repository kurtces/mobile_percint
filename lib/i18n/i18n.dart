import 'dart:async' show Future;
import 'package:flutter/foundation.dart' show SynchronousFuture;
import 'package:flutter/material.dart';

class I18nLocalizations {
  I18nLocalizations(this.locale);

  final Locale locale;

  static I18nLocalizations of(BuildContext context) {
    return Localizations.of<I18nLocalizations>(context, I18nLocalizations);
  }

  static Map<String, Map<String, String>> _localizedValues = {
    'en': {
      'title': 'Child Growth Calculator',
      'empty': '',
      'tab_main': 'Main',
      'tab_settings': 'Settings',
      'tab_help': 'Help',
      'tab_about': 'About',
      'form_title_text': 'Enter Data:',
      'form_gender_text': 'Gender:   ',
      'form_male_text': 'Boy',
      'form_female_text': 'Girl',
      'form_age_text': 'Age',
      'form_age_initial_value': '6',
      'form_age_error_text': 'Please enter a valid age.',
      'about_body_text': 'Developed by SyssLab - 2018',
      'about_flaticon_license_text': 'Icons designed by Smashicons and Freepik',
      'about_flaticon_license_text_2': '(http://www.freepik.com)',
      'about_flaticon_url': 'from Flaticon (https://www.flaticon.com)',
    },
    'es': {
      'title': 'Percentiles Infantiles',
      'empty': '',
      'tab_main': 'Principal',
      'tab_settings': 'Opciones',
      'tab_help': 'Ayuda',
      'tab_about': 'Acerca de',
      'form_title_text': 'Introduce los datos:',
      'form_gender_text': 'Género:   ',
      'form_male_text': 'Niño',
      'form_female_text': 'Niña',
      'form_age_text': 'Edad',
      'form_age_initial_value': '6',
      'form_age_error_text': 'Por favor, introduce una edad válida.',
      'about_body_text': 'Desarrollado por SyssLab - 2018',
      'about_flaticon_license_text': 'Icons designed by Smashicons and Freepik',
      'about_flaticon_license_text_2': '(http://www.freepik.com)',
      'about_flaticon_url': 'from Flaticon (https://www.flaticon.com)',
    },
  };

  String get title {
    return _localizedValues[locale.languageCode]['title'];
  }

  String get empty {
    return _localizedValues[locale.languageCode]['empty'];
  }

  String get tab_main {
    return _localizedValues[locale.languageCode]['tab_main'];
  }

  String get tab_settings {
    return _localizedValues[locale.languageCode]['tab_settings'];
  }

  String get tab_help {
    return _localizedValues[locale.languageCode]['tab_help'];
  }

  String get tab_about {
    return _localizedValues[locale.languageCode]['tab_about'];
  }

  String get form_title_text {
    return _localizedValues[locale.languageCode]['form_title_text'];
  }

  String get form_gender_text {
    return _localizedValues[locale.languageCode]['form_gender_text'];
  }

  String get form_male_text {
    return _localizedValues[locale.languageCode]['form_male_text'];
  }

  String get form_female_text {
    return _localizedValues[locale.languageCode]['form_female_text'];
  }

  String get form_age_text {
    return _localizedValues[locale.languageCode]['form_age_text'];
  }

  String get form_age_initial_value {
    return _localizedValues[locale.languageCode]['form_age_initial_value'];
  }

  String get form_age_error_text {
    return _localizedValues[locale.languageCode]['form_age_error_text'];
  }

  String get about_body_text {
    return _localizedValues[locale.languageCode]['about_body_text'];
  }

  String get about_flaticon_license_text {
    return _localizedValues[locale.languageCode]['about_flaticon_license_text'];
  }

  String get about_flaticon_license_text_2 {
    return _localizedValues[locale.languageCode]['about_flaticon_license_text_2'];
  }

  String get about_flaticon_url {
    return _localizedValues[locale.languageCode]['about_flaticon_url'];
  }
}

class I18nLocalizationsDelegate extends LocalizationsDelegate<I18nLocalizations> {
  const I18nLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => ['en', 'es'].contains(locale.languageCode);

  @override
  Future<I18nLocalizations> load(Locale locale) {
    return new SynchronousFuture<I18nLocalizations>(new I18nLocalizations(locale));
  }

  @override
  bool shouldReload(I18nLocalizationsDelegate old) => false;
}