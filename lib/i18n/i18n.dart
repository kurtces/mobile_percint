import 'dart:async' show Future;
import 'package:flutter/foundation.dart';
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
      'about_body_text': 'Developed by SyssLab - 2018',
      'flaticon_license_text': 'Icons designed by Smashicons from Flaticon',
      'flaticon_url': 'https://www.flaticon.com',
    },
    'es': {
      'title': 'Percentiles Infantiles',
      'empty': '',
      'tab_main': 'Principal',
      'tab_settings': 'Opciones',
      'tab_help': 'Ayuda',
      'tab_about': 'Acerca de',
      'about_body_text': 'Desarrollado por SyssLab - 2018',
      'flaticon_license_text': 'Icons designed by Smashicons from Flaticon',
      'flaticon_url': 'https://www.flaticon.com',
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
  String get about_body_text {
    return _localizedValues[locale.languageCode]['about_body_text'];
  }
  String get flaticon_license_text {
    return _localizedValues[locale.languageCode]['flaticon_license_text'];
  }
  String get flaticon_url {
    return _localizedValues[locale.languageCode]['flaticon_url'];
  }
}

class I18nLocalizationsDelegate extends LocalizationsDelegate<I18nLocalizations> {
  const I18nLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => ['en', 'es'].contains(locale.languageCode);

  @override
  Future<I18nLocalizations> load(Locale locale) {
    // Returning a SynchronousFuture here because an async "load" operation
    // isn't needed to produce an instance of DemoLocalizations.
    return new SynchronousFuture<I18nLocalizations>(new I18nLocalizations(locale));
  }

  @override
  bool shouldReload(I18nLocalizationsDelegate old) => false;
}