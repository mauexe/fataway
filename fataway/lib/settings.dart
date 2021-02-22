import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:settings_ui/settings_ui.dart';
import 'package:flutter/painting.dart';
import 'dashboard.dart';
import 'history.dart';
import 'statistics.dart';
import 'addmeal.dart';
import 'settings.dart';



class Settings extends StatelessWidget {
  // This widget is the root of your application.

  double weight = 0;
  double height = 0;

  final _amountValidator = RegExInputFormatter.withRegex('^\$|^(0|([1-9][0-9]{0,}))(\\.[0-9]{0,})?\$');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:
        SettingsList(
          backgroundColor: Colors.white,
          sections: [
            SettingsSection(
              title: 'Section',
              tiles: [
                SettingsTile(
                  title: 'Language',
                  subtitle: 'English',
                  leading: Icon(Icons.language),
                  onPressed: (BuildContext context) {},
                ),
                SettingsTile(
                  title: 'Weight',
                  //todo muss geändert werden wenn eine Eingabe vorhanden ist
                  subtitle: weight.toString() + " kg",
                  leading: Icon(Icons.accessibility),
                  onPressed: OpenWeight,
                ),
                SettingsTile(
                  title: 'Height',
                  //todo muss geändert werden wenn eine Eingabe vorhanden ist
                  subtitle: height.toString() + " cm",
                  leading: Icon(Icons.square_foot),
                  onPressed: OpenHeight,
                ),
              ],
            ),
          ],
        )
    );
  }

  OpenWeight(BuildContext context) {

    TextEditingController weightController = TextEditingController();

    return showDialog(context: context, builder: (context){
      return AlertDialog(
        title: Text('Enter your weight!'),
        content: TextField(
          controller: weightController,
          decoration: InputDecoration(labelText: "Weight (kg)"),
          keyboardType: TextInputType.numberWithOptions(
            decimal: true,
          ),
          inputFormatters: <TextInputFormatter>[
            _amountValidator,
        ]),
        actions: [
          FlatButton(
            textColor: Color(0xFF6200EE),
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('CANCEL'),
          ),
          FlatButton(
            textColor: Color(0xFF6200EE),
            onPressed: () {
              this.weight = double.parse(weightController.text);
              Navigator.pop(context);
            },
            child: Text('ACCEPT'),
          ),
        ],
      );
    });
  }

  OpenHeight(BuildContext context) {

    TextEditingController heightController = TextEditingController();

    return showDialog(context: context, builder: (context){
      return AlertDialog(
        title: Text('Enter your height!'),
        content: TextField(
            controller: heightController,
            decoration: InputDecoration(labelText: "Height (cm)"),
            keyboardType: TextInputType.numberWithOptions(
              decimal: true,
            ),
            inputFormatters: <TextInputFormatter>[
              _amountValidator,
            ]),
        actions: [
          FlatButton(
            textColor: Color(0xFF6200EE),
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('CANCEL'),
          ),
          FlatButton(
            textColor: Color(0xFF6200EE),
            onPressed: () {
              this.height = double.parse(heightController.text);
              Navigator.pop(context);
            },
            child: Text('ACCEPT'),
          ),
        ],
      );
    });
  }
}



class RegExInputFormatter implements TextInputFormatter {
  final RegExp _regExp;

  RegExInputFormatter._(this._regExp);

  factory RegExInputFormatter.withRegex(String regexString) {
    try {
      final regex = RegExp(regexString);
      return RegExInputFormatter._(regex);
    } catch (e) {
      // Something not right with regex string.
      assert(false, e.toString());
      return null;
    }
  }

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    final oldValueValid = _isValid(oldValue.text);
    final newValueValid = _isValid(newValue.text);
    if (oldValueValid && !newValueValid) {
      return oldValue;
    }
    return newValue;
  }

  bool _isValid(String value) {
    try {
      final matches = _regExp.allMatches(value);
      for (Match match in matches) {
        if (match.start == 0 && match.end == value.length) {
          return true;
        }
      }
      return false;
    } catch (e) {
      // Invalid regex
      assert(false, e.toString());
      return true;
    }
  }
}