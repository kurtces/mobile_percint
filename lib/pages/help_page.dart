import 'package:flutter/material.dart';
import 'package:mobile_percint/pages/model/Entry.dart';
import 'package:mobile_percint/pages/model/EntryItem.dart';

class HelpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
      itemBuilder: (BuildContext context, int index) =>
      new EntryItem(data[index]),
      itemCount: data.length,
    );
  }
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