import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:mobile_percint/i18n/i18n.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      localizationsDelegates: [
        const I18nLocalizationsDelegate(),
        // ... app-specific localization delegate[s] here
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('en', 'US'), // English
        const Locale('es', 'ES'), // Spanish
        // ... other locales the app supports
      ],
      home: new Column(
        crossAxisAlignment: CrossAxisAlignment.center, // start
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          new Text(I18nLocalizations.of(context).empty),
          new Text(I18nLocalizations.of(context).title),
          new Text(I18nLocalizations.of(context).empty),
          new Text(I18nLocalizations.of(context).about_body_text),//,
          //      style: DefaultTextStyle.of(context).style.apply(fontSizeFactor: 2.0)),
          new Expanded(
            child: new FittedBox(
              fit: BoxFit.contain, // otherwise the logo will be tiny
              child: const FlutterLogo(),
            ),
          ),
        ],
      ),
    );
  }
}