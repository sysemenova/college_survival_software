import 'dart:async';

//import 'package:intl/intl.dart';

import 'package:flutter/material.dart';
import 'householdtask.dart';
import 'householdtaskwidget.dart';
import 'globals.dart';

// ignore: must_be_immutable
class TaskListWidget extends StatefulWidget {
  HouseholdTaskList householdlist;
  var showDone;

  TaskListWidget(this.householdlist, this.showDone);

  @override
  _TaskListState createState() => _TaskListState(householdlist, showDone);
}

class _TaskListState extends State<TaskListWidget> {
  HouseholdTaskList householdlist;
  List tasks = [];
  String name;
  var showDone;
  Color barcolor;

  var hide = [], show = [], lists = [];

  _TaskListState(this.householdlist, this.showDone) {
    this.tasks = householdlist.tasks;
    this.name = householdlist.name;
    this.barcolor = householdlist.color;
  }

  // Currently runs before each build
  void updateTasks() {
    hide = []; show = []; lists = [];
    for (var i in tasks) {

      if (i is HouseholdTask) {
        i.update();
        if ((i.doneCheck && showDone) || (!i.doneCheck && !showDone))  {
          show.add(i);
        } else {
          hide.add(i);
        }
      } else if (i is HouseholdTaskList) {
        lists.add(i);
      } else {
        throw "Sad";
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    updateTasks();
    return Scaffold(
        appBar: AppBar(
          title: Text(this.name),
          backgroundColor: barcolor,
          actions: showDone ? null : [
            IconButton(icon: Icon(Icons.check), onPressed: pushListHidden,),
            IconButton(icon: Icon(Icons.calendar_today), onPressed: updateDay)
          ]
        ),
        body: ListView.builder(
            itemCount: (show.length + lists.length),
            padding: EdgeInsets.all(17),
            itemBuilder: (context, i) {
              if (i < show.length) {
                var cur = show[i];
                return buildRowTask(cur);
              } else {
                var cur = lists[i - show.length];
                return buildRowList(cur);
              }
            }));
  }

  Widget buildRowTask(HouseholdTask task) {
    // Format the date here. If showDone, show last done date. If not,
    // show created or due date. Most likely due date but whatever.

    return ListTile(
        title: Text(task.name),
        // How the hell does padding work lmao
        subtitle: Text(task.dateString()),
        trailing: Checkbox(
          value: task.doneCheck,
          onChanged: (value) {
            setState(() {
              task.changeDone();
            });
          },
        ),
        onTap: () {
          pushTask(task);
        });
  }

  void pushTask(HouseholdTask task) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => TaskWidget(task))
    ).then((value) => setState((){}));
  }

  Widget buildRowList(HouseholdTaskList tasklistie) {
    return ListTile(
        title: Text(tasklistie.name, style: TextStyle(color: tasklistie.color)),
        onTap: () {
          pushList(tasklistie, showDone);
        });
  }

  void pushList(HouseholdTaskList taskies, bool showDoneNew) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => TaskListWidget(taskies, showDoneNew),

        )
    ).then((value) => setState((){}));
  }

  void pushListHidden() {
    HouseholdTaskList cur = new HouseholdTaskList("Done", hide, color: barcolor);
    pushList(cur, true);
  }

  void updateDay() {
    setState(() {
      addToDate(Duration(days: 1));

    });
  }

}
