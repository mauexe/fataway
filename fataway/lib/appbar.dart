import 'package:flutter/material.dart';

class AppBar extends StatelessWidget {
  const AppBar({
    this.fabLocation = FloatingActionButtonLocation.centerDocked,
    this.shape = const CircularNotchedRectangle(),
  });

  final FloatingActionButtonLocation fabLocation;
  final dynamic shape;

  static final center


  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: shape,
      color: Colors.amber,
      child: IconTheme(
        child: ,
      )
    );
  }}