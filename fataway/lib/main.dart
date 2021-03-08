import 'package:flutter/material.dart';
import 'appbar_contents/BottomAppBar_FAB.dart';
import 'dashboard.dart';
import 'history.dart';
import 'statistics.dart';
import 'addmeal.dart';
import 'settings.dart';


void main() async {
  runApp(RootApp());
}

class RootApp extends StatelessWidget {
  static const String _title = 'FatAway';
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: RootStatefulWidget(),
    );
  }
}

class RootStatefulWidget extends StatefulWidget {
  RootStatefulWidget({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _RootStatefulWidgetSate();
  }
}

class _RootStatefulWidgetSate extends State<RootStatefulWidget> {
  int _selectedIndex = 0;
  static List<Widget> _options = <Widget> [
    Dashboard(),
    StatisticsWidget(),
    History(),
    Settings(),
    AddMeal(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  void _onButtonTapped(){
    setState(() {
      _selectedIndex = 3;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () => _onItemTapped(_options.length-1),
        tooltip: "Add Meal",
        child: Icon(Icons.add),
        elevation: 2,
      ),
      bottomNavigationBar: BottomAppBar(
        child: FABBottomAppBar(
          onTabSelected: _onItemTapped,
          items: [
            FABBottomAppBarItem(iconData: Icons.dashboard, label: "Dashboard"),
            FABBottomAppBarItem(iconData: Icons.leaderboard, label: "Statistics"),
            FABBottomAppBarItem(iconData: Icons.history, label: "History"),
            FABBottomAppBarItem(iconData: Icons.settings, label: "Settings")
          ],
          notchedShape: CircularNotchedRectangle(),
        ),
        elevation: 2,
      ),
      body: _options[_selectedIndex]
    );
  }
}

