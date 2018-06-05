import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:mobile_percint/i18n/i18n.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
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
      onGenerateTitle: (BuildContext context) => I18nLocalizations.of(context).title,
      //title: 'Flutter Demo',
      theme: new ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or press Run > Flutter Hot Reload in IntelliJ). Notice that the
        // counter didn't reset back to zero; the application is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new DefaultTabController(
        length: 3, // The number of tabs / content sections we need to display
        child: new Scaffold(
          appBar: new AppBar(
            bottom: new TabBar(
              tabs: [
                new Tab(icon: new Icon(Icons.child_care), // child_friendly
                        text:new Text(I18nLocalizations.of(context).tab_main)),
                new Tab(icon: new Icon(Icons.settings), // settings_applications
                        text:new Text(I18nLocalizations.of(context).tab_settings)),
                new Tab(icon: new Icon(Icons.help), // help_outline | live_help
                        text:new Text(I18nLocalizations.of(context).tab_help)),
                new Tab(icon: new Icon(Icons.bubble_chart),
                        text:new Text(I18nLocalizations.of(context).tab_about)),
              ],
            ),
            title: new Text(I18nLocalizations.of(context).title),
          ),
          body: new TabBarView(
            children: [
              new Icon(Icons.child_care),
              new Icon(Icons.settings), // settings_applications
              new Icon(Icons.help), // help_outline | live_help
              new Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  new Text(I18nLocalizations.of(context).title),
                  new Text(I18nLocalizations.of(context).empty),
                  new Text('Developed by SyssLab - 2018', style: DefaultTextStyle.of(context).style.apply(fontSizeFactor: 2.0)),
                  /*
                  new Expanded(
                    child: new FittedBox(
                      fit: BoxFit.contain, // otherwise the logo will be tiny
                      child: const FlutterLogo(),
                    ),
                  ),
                  */
                ],
              ),
            ],
          ),
        ),
      ),
    );
    //return new Scaffold(
    //  appBar: new AppBar(
    //    title: new Text(I18nLocalizations.of(context).title),
    //  ),
    //  body: new Center(
    //  child: new Text(I18nLocalizations.of(context).title),
    //),
    //);
  }
}