import 'package:flutter/material.dart';
import 'package:mobile_percint/i18n/i18n.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Column(
      crossAxisAlignment: CrossAxisAlignment.center, // start
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        new Text(I18nLocalizations.of(context).empty,
          style: new TextStyle(fontWeight: FontWeight.bold),),
        new Text(I18nLocalizations.of(context).title),
        new Text(I18nLocalizations.of(context).empty),
        new Image.asset(
          'assets/logo.png',
          height: 240.0,
          fit: BoxFit.cover,
        ),
        new Text(I18nLocalizations.of(context).empty),
        new Text(I18nLocalizations.of(context).about_body_text),
        new Text(I18nLocalizations.of(context).empty),
        new Text(I18nLocalizations.of(context).about_flaticon_license_text),
        new Text(I18nLocalizations.of(context).about_flaticon_license_text_2),
        new Text(I18nLocalizations.of(context).about_flaticon_url),
        new Text(I18nLocalizations.of(context).empty),
      ],
    );
  }
}