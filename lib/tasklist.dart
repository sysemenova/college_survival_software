import 'dart:async';

import 'package:flutter/material.dart';
import 'householdtask.dart';

// ignore: must_be_immutable
class TaskListWidget extends StatefulWidget {
  var tasks = [];
  String name;

  TaskListWidget(this.name, this.tasks);

  @override
  _TaskListState createState() => _TaskListState(name, tasks);
}

class _TaskListState extends State<TaskListWidget> {
  var tasks = [];
  String name;

  _TaskListState(this.name, this.tasks);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(this.name),
        ),
        body: ListView.builder(
            itemCount: tasks.length,
            padding: EdgeInsets.all(17),
            itemBuilder: (context, i) {
              var cur = tasks[i];
              return cur is HouseholdTask
                  ? buildRowTask(cur)
                  : buildRowList(cur);
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
        title: Text(tasklistie.name, style: TextStyle(color: Colors.blue)),
        onTap: () {
          pushList(tasklistie);
        });
  }

  void pushList(HouseholdTaskList taskies) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => TaskListWidget(taskies.name, taskies.tasks)
        )
    ).then((value) => setState((){}));
  }

  FutureOr onGoBack (dynamic value) {
    setState(() {

    });
  }
}
