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

  //todo Speicherung der Werte in eine Datei
  double weight = 0;
  double height = 0;
  bool loosingWeight = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Settings"),
        ),
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
                      //todo Strich ist stärker zu sehen als andere
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
                        title: 'Gain or Loose',
                        subtitle: ReturnSentence(),
                        leading: Icon(Icons.settings),
                        onPressed: (BuildContext context) {
                          setState(() {
                            if(loosingWeight == false){
                              loosingWeight = true;
                            }
                            else{
                              loosingWeight = false;
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
    if(loosingWeight == true) {
      return "You currently want to loose weight";
    }
    else
      return "You currently want to gain weight";
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
