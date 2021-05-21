import 'dart:async';

//import 'package:intl/intl.dart';

import 'package:flutter/material.dart';
import 'householdtask.dart';
import 'householdtaskwidget.dart';
import 'globals.dart';

class InputTaskWidget extends StatefulWidget {
  Color barcolor;

  InputTaskWidget({Color this.barcolor = Colors.blue});

  @override
  _InputTaskWidgetState createState() => _InputTaskWidgetState(barcolor);
}

class _InputTaskWidgetState extends State<InputTaskWidget> {
  TextEditingController nameController = TextEditingController();
  TextEditingController whyController = TextEditingController();
  TextEditingController howController = TextEditingController();
  TextEditingController everyController = TextEditingController();
  List<String> options = ['none', 'days', 'weeks'];
  var dropdownValue = 'none';

  Color barcolor;

  _InputTaskWidgetState(this.barcolor);

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(title: Text("Input a Task"), backgroundColor: barcolor,),
      body: ListView(
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
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
              child: Row(
                  children:
                  [
                    Flexible(child: TextField(
                      decoration: InputDecoration(labelText: 'Every'),
                      controller: everyController,
                      keyboardType: TextInputType.number,
                    )),
                    DropdownButton<String>(
                    value: dropdownValue,
                    onChanged: (String newValue) {
                      setState(() {
                        dropdownValue = newValue;
                      });
                    },
                    items: options.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String> (
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  )]
              )
          ),

          Align(
              child: RaisedButton(
                child: Text('Submit'),
                onPressed: (){
                  //recurringArgs: {Symbol("every"): Duration(days: 1)}
                  var toret;
                  if (dropdownValue != 'none' && everyController.text != '') {
                    var numdays = int.parse(everyController.text);
                    if (dropdownValue == options[2]) {
                      numdays *= 7;
                    }
                    toret = HouseholdTask(nameController.text, whyController.text, howController.text, false,
                      recurringArgs: {Symbol("every"): Duration(days: numdays)});
                  } else {
                    toret = HouseholdTask(nameController.text, whyController.text, howController.text, false);
                  }
                  toret = toret.checkEmpty() ? null : toret;
                  Navigator.pop(context, toret);},
              )
          ),
        ],
      ),
    );
  }
}
