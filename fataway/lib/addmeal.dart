
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddMeal extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AddMealState();
  }
  
}

class _AddMealState extends State<AddMeal> {
  int _value = 0;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        DropdownButton(
          value: _value,
            items: [
              DropdownMenuItem(child: Text("Test1"), value: 0),
              DropdownMenuItem(child: Text("Test2"), value: 1),
              DropdownMenuItem(child: Text("Test3"), value: 2)
            ],
          onChanged: null,
          hint: Text("Select"),
        )
      ],
    );
  }
  
  
}