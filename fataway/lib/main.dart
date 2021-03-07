import 'package:flutter/material.dart';
import 'dashboard.dart';
import 'history.dart';
import 'statistics.dart';
import 'addmeal.dart';
import 'settings.dart';

void main() {
  //await Hive.initFlutter();

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
    AddMeal(),
    History(),
    Settings(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _options.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem> [
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.leaderboard),
            label: 'Statistics',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_circle),
            label: 'Add Meal',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: 'History',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
      ),
    );
  }
}

