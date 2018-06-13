import 'package:flutter/material.dart';
import 'package:mobile_percint/i18n/i18n.dart';

class FormPage extends StatefulWidget {
  @override
  FormPageState createState() => new FormPageState();
}

class FormPageState extends State<FormPage> {
  final scaffoldKey = new GlobalKey<ScaffoldState>();
  final formKey = new GlobalKey<FormState>();

  final RegExp agePattern = new RegExp(r'0-9');

  int genderValue = 0;
  String _email;
  String _password;

  void _submit() {
    final form = formKey.currentState;

    if (form.validate()) {
      form.save();

      // Email & password matched our validation rules
      // and are saved to _email and _password fields.
      _performLogin();
    }
  }

  void _performLogin() {
    // This is just a demo, so no actual login here.
    final snackbar = new SnackBar(
      content: new Text('Email: $_email, password: $_password'),
    );

    scaffoldKey.currentState.showSnackBar(snackbar);
  }

  @override
  Widget build(BuildContext context) {
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
                  /*
                  new TextFormField(
                    decoration: new InputDecoration(labelText: I18nLocalizations.of(context).form_age_text),
                    initialValue: I18nLocalizations.of(context).form_age_initial_value,
                    autocorrect: false,
                    autovalidate: true,
                    validator: (val) => val.isNotEmpty ? I18nLocalizations.of(context).form_age_error_text : null,
                    onSaved: (val) => _email = val,
                  ),
                  */
                ],
              ),
              new RaisedButton(
                onPressed: _submit,
                child: new Text('Login'),
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