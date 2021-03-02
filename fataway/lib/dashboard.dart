import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:percent_indicator/percent_indicator.dart';

class Dashboard extends StatefulWidget{
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 40),
        child: Column(
          children: <Widget>[
            Text("Today's calorie intake", style: TextStyle(fontSize: 40, fontWeight: FontWeight.w400)),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                new CircularPercentIndicator(
                    radius: 325.0,
                    animation: true,
                    animationDuration: 800,
                    lineWidth: 30.0,
                    percent: 0.5,
                    center: new Text("500/1000 kcal", style: new TextStyle(fontSize: 30.0)),
                    progressColor: Colors.orange,
                    circularStrokeCap: CircularStrokeCap.round),
              ],
            ),
            SizedBox(height: 40),
            Text("Nutrients", style: TextStyle(fontSize: 40, fontWeight: FontWeight.w400)),
            SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                new Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    new Row(
                        children: <Widget>[
                          Text("Protein", style: new TextStyle(fontSize: 25.0))
                        ]
                    ),
                    SizedBox(height: 5),
                    new Row(
                        children: <Widget>[
                          Text("Fat", style: new TextStyle(fontSize: 25.0))
                        ]
                    ),
                    SizedBox(height: 5),
                    new Row(
                        children: <Widget>[
                          Text("Sodium", style: new TextStyle(fontSize: 25.0))
                        ]
                    ),
                    SizedBox(height: 5),
                    new Row(
                        children: <Widget>[
                          Text("Carbs", style: new TextStyle(fontSize: 25.0))
                        ]
                    )
                  ],
                ),
                SizedBox(width: 10),
                new Column(
                  children: <Widget>[
                        new Row(
                            children: <Widget>[
                              new LinearPercentIndicator(
                                  width: 200.0,
                                  percent: 0.8,
                                  lineHeight: 20.0,
                                  animation: true,
                                  animationDuration: 800,
                                  center: Text("80g / 100g"),
                                  progressColor: Colors.lightBlueAccent
                              )
                            ]
                        ),
                        SizedBox(height: 15),
                        new Row(
                            children: <Widget>[
                              new LinearPercentIndicator(
                                  width: 200.0,
                                  percent: 0.3,
                                  lineHeight: 20.0,
                                  animation: true,
                                  animationDuration: 800,
                                  center: Text("20g / 60g"),
                                  progressColor: Colors.redAccent
                              )
                            ]
                        ),
                        SizedBox(height: 15),
                        new Row(
                            children: <Widget>[
                              new LinearPercentIndicator(
                                  width: 200.0,
                                  percent: 0.95,
                                  lineHeight: 20.0,
                                  animation: true,
                                  animationDuration: 800,
                                  center: Text("3g / 3,4g"),
                                  progressColor: Colors.green
                              )
                            ]
                        ),
                        SizedBox(height: 15),
                        new Row(
                            children: <Widget>[
                              new LinearPercentIndicator(
                                  width: 200.0,
                                  percent: 0.15,
                                  lineHeight: 20.0,
                                  animation: true,
                                  animationDuration: 800,
                                  center: Text("45g / 300g"),
                                  progressColor: Colors.yellow
                              )
                            ]
                        )
                      ],
                    )
                  ],
                )
              ]
            )
        ),
      );
  }
}