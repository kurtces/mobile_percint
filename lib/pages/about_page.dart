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
        new Expanded(
          child: new FittedBox(
            fit: BoxFit.contain, // otherwise the logo will be tiny
            child: const FlutterLogo(),
          ),
        ),
        new Text(I18nLocalizations.of(context).empty),
        new Text(I18nLocalizations.of(context).about_body_text),
        new Text(I18nLocalizations.of(context).empty),
        new Text(I18nLocalizations.of(context).flaticon_license_text),
        new Text(I18nLocalizations.of(context).empty),
        new Text(I18nLocalizations.of(context).flaticon_url),
        new Text(I18nLocalizations.of(context).empty),
      ],
    );
  }
}