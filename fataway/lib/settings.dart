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
                  leading: Icon(Icons.all_out),
                  onPressed: OpenWeight,
                ),
                SettingsTile(
                  title: 'Height',
                  //todo muss geändert werden wenn eine Eingabe vorhanden ist
                  subtitle: 170.toString() + " cm",
                  leading: Icon(Icons.all_out),
                  onPressed: OpenWeight,
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
          decoration: InputDecoration(labelText: "Enter your weight"),
          keyboardType: TextInputType.number,
          inputFormatters: <TextInputFormatter>[
          FilteringTextInputFormatter.digitsOnly
          // todo Dezimale Zahlen eingeben
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

}

class SimpleDialogItem extends StatelessWidget {
  const SimpleDialogItem({Key key, this.icon, this.color, this.text, this.onPressed})
      : super(key: key);

  final IconData icon;
  final Color color;
  final String text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SimpleDialogOption(
      onPressed: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(icon, size: 36.0, color: color),
          Padding(
            padding: const EdgeInsetsDirectional.only(start: 16.0),
            child: Text(text),
          ),
        ],
      ),
    );
  }
}
