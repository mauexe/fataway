import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

// andere Funktionen möglich
/*
enum SlidableAction { delete }

class History extends StatefulWidget {
  @override
  _HistoryState createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  // Testdaten
  static List<String> entries = <String>['Avocado', 'Bubble Tea', 'Ice Cream', 'Soup', 'Orange juice', 'Schnitzel', 'Pizza', 'Apple'];

  Widget _buildList() {
    return ListView.builder(
      itemCount: entries.length,
      itemBuilder: (context, item) {
        return SlidableWidget(
            child: _buildRow(entries[item]),
            onDismissed: (action) =>
              dismissSlidableItem(context, item, action),
        );
      }
    );
  }

  void dismissSlidableItem(BuildContext context, int index, SlidableAction action) {
    setState(() {
      entries.removeAt(index);
    });

    switch(action) {
      case SlidableAction.delete:
        Utils.showSnackBar(context, "Entry was deleted");
        break;
    }
  }

  Widget _buildRow(String entry) {
    DateTime now = new DateTime.now();

    return new Container(
      padding: const EdgeInsets.all(8.0),
      decoration: new BoxDecoration(
        // color: Colors.grey,
        border: Border(
          bottom: BorderSide(width: 1.0, color: Colors.black)
        )
      ),
      child: new ListTile (
        title: Text(entry),
        subtitle: Text(DateFormat.yMd().add_jm().format(now)),
        trailing: Icon(Icons.keyboard_arrow_down),
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildList()
    );
  }
}

class SlidableWidget extends StatelessWidget{
  final Widget child;
  final Function(SlidableAction action) onDismissed;

  const SlidableWidget({
    @required this.child,
    @required this.onDismissed,
    Key key,
  }) : super(key : key);

  @override
  Widget build(BuildContext context) => Slidable(
    actionPane: SlidableScrollActionPane(),
    child: child,
    // right side
    secondaryActions: <Widget>[
      IconSlideAction(
        caption: 'Delete',
        color: Colors.red,
        icon: Icons.delete,
        onTap: () => onDismissed(SlidableAction.delete),
      )
    ]
  );
}

class Utils {
  static void showSnackBar(BuildContext context, String message) =>
      Scaffold.of(context)..hideCurrentSnackBar()..showSnackBar(SnackBar(content: Text(message)));
}
*/
enum SlidableAction { delete }


class History extends StatefulWidget {
  @override
  _HistoryState createState() => _HistoryState();
}



class _HistoryState extends State<History> {

  Widget _buildList() {
    return new Scaffold(
      body: new ListView.builder(
        itemCount: meal.length,
        itemBuilder: (context, i) {
          return SlidableWidget(
              child:
                new ExpansionTile(
                  title: new Text(meal[i].title, style: new TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),),
                  children: <Widget>[
                  new Column(
                  children: _buildExpandableContent(meal[i]),
                  ),
                ],
              ),
            onDismissed: (action) =>
                dismissSlidableItem(context, i, action),
          );
        },
      ),

    );

  }

  _buildExpandableContent(Meal meal) {
    List<Widget> columnContent = [];

    for (String content in meal.contents)
      columnContent.add(
        new ListTile(
          title: new Text(content, style: new TextStyle(fontSize: 18.0),),
          leading: new Icon(meal.icon),
        ),
      );

    return columnContent;
  }

  void dismissSlidableItem(BuildContext context, int index, SlidableAction action) {
    setState(() {
      meal.removeAt(index);
    });

    switch (action) {
      case SlidableAction.delete:
        Utils.showSnackBar(context, "Entry was deleted");
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _buildList()
    );
  }
}

class SlidableWidget extends StatelessWidget{
  final Widget child;
  final Function(SlidableAction action) onDismissed;

  const SlidableWidget({
    @required this.child,
    @required this.onDismissed,
    Key key,
  }) : super(key : key);

  @override
  Widget build(BuildContext context) => Slidable(
      actionPane: SlidableScrollActionPane(),
      child: child,
      // right side
      secondaryActions: <Widget>[
        IconSlideAction(
          caption: 'Delete',
          color: Colors.red,
          icon: Icons.delete,
          onTap: () => onDismissed(SlidableAction.delete),
        )
      ]
  );
}

class Utils {
  static void showSnackBar(BuildContext context, String message) =>
      Scaffold.of(context)..hideCurrentSnackBar()..showSnackBar(SnackBar(content: Text(message)));
}


class Meal {
  final String title;
  List<String> contents = [];
  final IconData icon;

  Meal(this.title, this.contents, this.icon);
}

List<Meal> meal = [
  new Meal(
    'Burger',
    ['Calory', 'Calories taken', 'test', 'demo'],
    Icons.fastfood,
  ),
  new Meal(
    'Cheese',
    ['Calory', 'Calories taken', 'test', 'demo'],
    Icons.fastfood,
  ),
  new Meal(
    'Spaghetti',
    ['Calory', 'Calories taken', 'test', 'demo'],
    Icons.fastfood,
  ),
];