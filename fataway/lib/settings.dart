import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:settings_ui/settings_ui.dart';
import 'package:flutter/painting.dart';
import 'dashboard.dart';
import 'history.dart';
import 'main.dart';
import 'statistics.dart';
import 'addmeal.dart';
import 'settings.dart';

class Settings extends StatefulWidget {

  Settings({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _SettingsState();
  }

}

class _SettingsState extends State<Settings> {

  double weight;
  double height;
  bool losingWeight;

  _SettingsState() {
  }

  //todo Speicherung der Werte in eine Datei
  final _amountValidator = RegExInputFormatter.withRegex('^\$|^(0|([1-9][0-9]{0,}))(\\.[0-9]{0,})?\$');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:
        Container(
          child: Container(
            margin: EdgeInsets.only(left: 0, top: 10, right: 0, bottom: 0),
            child:
              SettingsList(
                backgroundColor: Colors.white,
                sections: [
                  SettingsSection(
                    tiles: [
                      SettingsTile(
                        title: 'Language',
                        subtitle: 'English',
                        leading: Icon(Icons.language),
                        onPressed: (BuildContext context) {},
                      ),
                      SettingsTile(
                        title: 'Weight',
                        subtitle: weight.toString() + " kg",
                        leading: Icon(Icons.accessibility),
                        onPressed: OpenWeight,
                      ),
                      SettingsTile(
                        title: 'Height',
                        subtitle: height.toString() + " cm",
                        leading: Icon(Icons.square_foot),
                        onPressed: OpenHeight,
                      ),
                      SettingsTile(
                        title: 'Preferences',
                        subtitle: ReturnSentence(),
                        leading: Icon(Icons.settings),
                        onPressed: (BuildContext context) {
                          setState(() {
                            if(losingWeight == false){
                              losingWeight = true;
                            }
                            else{
                              losingWeight = false;
                            }
                          });
                        },
                      ),
                      SettingsTile(
                        title: 'App-Info',
                        subtitle: "Information about fatAway",
                        leading: Icon(Icons.info_outline),
                        onPressed: OpenInfo,
                      ),
                    ],
                  ),
                ],
              ),
          ),
        )
    );
  }

  ReturnSentence(){
    if(losingWeight == true) {
      return "lose weight";
    }
    else{
      return "gain weight";
    }

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
              setState(() {
                this.weight = double.parse(weightController.text);
              });
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
              setState(() {
                this.height = double.parse(heightController.text);
              });
              Navigator.pop(context);
            },
            child: Text('ACCEPT'),
          ),
        ],
      );
    });
  }

  OpenInfo(BuildContext context){
    return showDialog(context: context, builder: (context){
      return new AlertDialog(
          title: Text('About the App'),
          content: Container(
            height: 100,
            child: Column(
              children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [Text("Version:"), Text("1.0")],
                  ),
                  SizedBox(width: 20, height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [Text("Latest Update:"), Text("02.03.2021")],
                  )
                ],
            ),
          ),
          actions: [
            FlatButton(
              textColor: Color.fromRGBO(21, 158, 0, 1),
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('OK', style: TextStyle(fontSize: 17),),
            ),

]
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