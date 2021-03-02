
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddMeal extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AddMealState();
  }
  
}

class _AddMealState extends State<AddMeal> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        DropdownButton(
            items: [
              DropdownMenuItem(child: Text("Test1"))
            ],
            onChanged: null
        )
      ],
    );
  }
  
  
}