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
      'tab_main': 'Main',
      'tab_settings': 'Settings',
      'tab_help': 'Help',
      'tab_about': 'About'
    },
    'es': {
      'title': 'Percentiles Infantiles',
      'tab_main': 'Principal',
      'tab_settings': 'Opciones',
      'tab_help': 'Ayuda',
      'tab_about': 'Acerca de'
    },
  };
  String get title {
    return _localizedValues[locale.languageCode]['title'];
  }
  String get googleLogin {
    return _localizedValues[locale.languageCode]['googleLogin'];
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