import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile_percint/i18n/i18n.dart';

class FormPage extends StatefulWidget {
  @override
  FormPageState createState() => new FormPageState();
}

class FormPageState extends State<FormPage> {
  final scaffoldKey = new GlobalKey<ScaffoldState>();
  final formKey = new GlobalKey<FormState>();

  final List<String> ageTypes = const <String>[
    'Sarcoline', 'Coquelicot', 'Smaragdine'
  ];
  final double _kPickerItemHeight = 32.0;

  int genderValue = 0;
  String age;
  int ageTypeSelected;

  void _submit() {
    final form = formKey.currentState;

    if (form.validate()) {
      form.save();

      // Let's generate child growth charts from data introduced...
      generateCharts();
    }
  }

  void generateCharts() {
    // TODO This is just a demo, so no actual login here.
    final snackbar = new SnackBar(
      content: new Text('Email: $age'),
    );

    scaffoldKey.currentState.showSnackBar(snackbar);
  }

  @override
  Widget build(BuildContext context) {
    //final FixedExtentScrollController scrollController = new FixedExtentScrollController(initialItem: ageTypeSelected);

    return new Scaffold(
      key: scaffoldKey,
      appBar: new AppBar(
        title: new Text(I18nLocalizations.of(context).form_title_text),
      ),
      body: new Padding(
        padding: const EdgeInsets.all(16.0),
        child: new Form(
          key: formKey,
          child: new Column(
            children: [
              new Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  //new Text(I18nLocalizations.of(context).form_gender_text),
                  new Text(I18nLocalizations.of(context).form_male_text),
                  new Radio<int>(
                      value: 0,
                      groupValue: genderValue,
                      onChanged: handleGenderValueChanged,
                      activeColor: Colors.blue,
                  ),
                  new Text(I18nLocalizations.of(context).form_female_text),
                  new Radio<int>(
                      value: 1,
                      groupValue: genderValue,
                      onChanged: handleGenderValueChanged,
                      activeColor: Colors.blue,
                  ),
                ],
              ),
              new Row(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  new Flexible( // Expanded(
                      child: new Column(
                        children: <Widget>[
                          new TextFormField(
                            decoration: new InputDecoration(labelText: I18nLocalizations.of(context).form_age_text),
                            initialValue: I18nLocalizations.of(context).form_age_initial_value,
                            autocorrect: false,
                            autovalidate: true,
                            validator: (val) => val.isNotEmpty ? null : I18nLocalizations.of(context).form_age_error_text,
                            onSaved: (val) => age = val,
                          ),
                          new Radio<int>(
                            value: 0,
                            groupValue: genderValue,
                            onChanged: handleGenderValueChanged,
                            activeColor: Colors.blue,
                          ),
                        ],
                      ),
                  ),
                ],
              ),
              new Row(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  new RaisedButton(
                    onPressed: _submit,
                    child: new Text('Login'),
                  ),
                ]
              ),
            ],
          ),
        ),
      ),
    );
  }

  void handleGenderValueChanged(int value) {
    setState(() {
      genderValue = value;
    });
  }
}