import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:mobile_percint/i18n/i18n.dart';
import 'package:mobile_percint/pages/about_page.dart';
import 'package:mobile_percint/pages/form_page.dart';
import 'package:mobile_percint/pages/help_page.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      onGenerateTitle: (BuildContext context) => I18nLocalizations.of(context).title,
      // Lookup an app’s current locale with Locale myLocale = Localizations.localeOf(context);
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
      theme: new ThemeData(
        primarySwatch: Colors.green,//blue,
      ),
      home: new HomeApp(),
    );
  }
}

class HomeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new DefaultTabController(
      length: 4, // The number of tabs / content sections we need to display
      child: new Scaffold(
        appBar: new AppBar(
          bottom: new TabBar(
            tabs: [
              new Tab(icon: new Icon(Icons.child_care), // child_friendly
                  text: I18nLocalizations.of(context).tab_main),
              new Tab(icon: new Icon(Icons.settings), // settings_applications
                  text: I18nLocalizations.of(context).tab_settings),
              new Tab(icon: new Icon(Icons.help), // help_outline | live_help
                  text: I18nLocalizations.of(context).tab_help),
              new Tab(icon: new Icon(Icons.bubble_chart),
                  text: I18nLocalizations.of(context).tab_about),
            ],
          ),
          title: new Text(I18nLocalizations.of(context).title),
        ),
        body: new TabBarView(
          children: [
            new FormPage(),
            new Icon(Icons.settings), // settings_applications
            new HelpPage(),
            new AboutPage(),
          ],
        ),
      ),
    );
  }
}
