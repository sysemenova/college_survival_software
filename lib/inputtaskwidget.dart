import 'dart:async';

//import 'package:intl/intl.dart';

import 'package:flutter/material.dart';
import 'householdtask.dart';
import 'householdtaskwidget.dart';
import 'globals.dart';

class InputTaskWidget extends StatefulWidget {
  @override
  _InputTaskWidgetState createState() => _InputTaskWidgetState();
}

class _InputTaskWidgetState extends State<InputTaskWidget> {
  TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("yup")),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(40),
            child: TextField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: 'Name of Task',
              ),
            )
          ),
          RaisedButton(
            child: Text('Test'),
            onPressed: (){
              Navigator.pop(context, nameController.text);},
          )
        ],
      ),
    );
  }
}
