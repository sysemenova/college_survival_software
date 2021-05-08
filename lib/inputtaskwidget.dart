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
  TextEditingController whyController = TextEditingController();
  TextEditingController howController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Input a Task")),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
            child: TextField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: 'Name of Household Task',
              ),
            )
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
            child: TextField(
              controller: whyController,
              decoration: InputDecoration(
                labelText: 'Why is this important?',
              ),
            )
          ),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
              child: TextField(
                controller: howController,
                decoration: InputDecoration(
                  labelText: 'How are you going to do this?',
                ),
              )
          ),
          RaisedButton(
            child: Text('Submit'),
            onPressed: (){
              var toret = HouseholdTask(nameController.text, whyController.text, howController.text, false);
              Navigator.pop(context, toret);},
          )
        ],
      ),
    );
  }
}
