import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:mobile_percint/i18n/i18n.dart';
import 'package:mobile_percint/pages/about_page.dart';

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
      theme: new ThemeData(
        primarySwatch: Colors.green,//blue,
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
              new Icon(Icons.child_care),
              new Icon(Icons.settings), // settings_applications
              new ListView.builder(
                itemBuilder: (BuildContext context, int index) =>
                new EntryItem(data[index]),
                itemCount: data.length,
              ),
              new Column(
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
              ),
              // new AboutPage(),
            ],
          ),
        ),
      ),
    );
  }
}

// Displays one Entry. If the entry has children then it's displayed
// with an ExpansionTile.
class EntryItem extends StatelessWidget {
  const EntryItem(this.entry);

  final Entry entry;

  Widget _buildTiles(Entry root) {
    if (root.children.isEmpty) return new ListTile(title: new Text(root.title));
    return new ExpansionTile(
      key: new PageStorageKey<Entry>(root),
      title: new Text(root.title),
      children: root.children.map(_buildTiles).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildTiles(entry);
  }
}

// One entry in the multilevel list displayed by this app.
class Entry {
  Entry(this.title, [this.children = const <Entry>[]]);

  final String title;
  final List<Entry> children;
}

// The entire multilevel list displayed by this app.
final List<Entry> data = <Entry>[
  new Entry(
    'Chapter A',
    <Entry>[
      new Entry(
        'Section A0',
        <Entry>[
          new Entry('Item A0.1'),
          new Entry('Item A0.2'),
          new Entry('Item A0.3'),
        ],
      ),
      new Entry('Section A1'),
      new Entry('Section A2'),
    ],
  ),
  new Entry(
    'Chapter B',
    <Entry>[
      new Entry('Section B0'),
      new Entry('Section B1'),
    ],
  ),
  new Entry(
    'Chapter C',
    <Entry>[
      new Entry('Section C0'),
      new Entry('Section C1'),
      new Entry(
        'Section C2',
        <Entry>[
          new Entry('Item C2.0'),
          new Entry('Item C2.1'),
          new Entry('Item C2.2'),
          new Entry('Item C2.3'),
        ],
      ),
    ],
  ),
];