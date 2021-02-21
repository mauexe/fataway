import 'package:flutter/material.dart';



class StatisticsWidget extends StatelessWidget {
  static const String _title = 'Statistics';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: Scaffold(
        body: StatisticsList(),
      ),
    );
  }
}

class StatisticsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new ListView.builder(
        itemCount: day.length,
        itemBuilder: (context, i) {
          return new ExpansionTile(
            title: new Text(day[i].title, style: new TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),),
            children: <Widget>[
              new Column(
                children: _buildExpandableContent(day[i]),
              ),
            ],
          );
        },
      ),
    );
  }

  _buildExpandableContent(Day day) {
    List<Widget> columnContent = [];

    for (String content in day.contents)
      columnContent.add(
        new ListTile(
          title: new Text(content, style: new TextStyle(fontSize: 18.0),),
          leading: new Icon(day.icon),
        ),
      );

    return columnContent;
  }
}

class Day {
  final String title;
  List<String> contents = [];
  final IconData icon;

  Day(this.title, this.contents, this.icon);
}

List<Day> day = [
  new Day(
    'Monday',
    ['Calory goal', 'Calories taken', 'test', 'demo'],
    Icons.fastfood,
  ),

];

