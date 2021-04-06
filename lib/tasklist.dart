import 'dart:async';

import 'package:flutter/material.dart';
import 'householdtask.dart';

// ignore: must_be_immutable
class TaskListWidget extends StatefulWidget {
  var tasks = [];
  String name;
  var showDone;
  Color color;

  TaskListWidget(this.name, this.tasks, this.showDone, {this.color: Colors.blue});

  @override
  _TaskListState createState() => _TaskListState(name, tasks, showDone, barcolor: color);
}

class _TaskListState extends State<TaskListWidget> {
  List tasks = [];
  String name;
  var showDone;
  Color barcolor;

  var hide = [], show = [], lists = [];

  _TaskListState(this.name, this.tasks, this.showDone, {this.barcolor: Colors.blue});

  // Currently runs before each build
  void updateTasks() {
    hide = []; show = []; lists = [];
    for (var i in tasks) {
      if (i is HouseholdTask) {
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
          actions: [
            IconButton(icon: Icon(Icons.check), onPressed: pushListHidden,)
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
    return ListTile(
        title: Text(task.name),
        // How the hell does padding work lmao
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
            builder: (context) => TaskListWidget(taskies.name, taskies.tasks, showDoneNew, color: taskies.color)
        )
    ).then((value) => setState((){}));
  }

  void pushListHidden() {
    HouseholdTaskList cur = new HouseholdTaskList("Done", hide, color: barcolor);
    pushList(cur, true);
  }

  FutureOr onGoBack (dynamic value) {
    setState(() {

    });
  }
}
