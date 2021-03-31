import 'package:flutter/material.dart';
final font = TextStyle(fontSize: 20);

class HouseholdTask {
  String name, why, how;
  var doneCheck;

  HouseholdTask(this.name, this.why, this.how, this.doneCheck);

  void changeDone() => doneCheck ? doneCheck = false : doneCheck = true;
}

class HouseholdTaskList {
  String name;
  List tasks;

  HouseholdTaskList(this.name, this.tasks);
}


class TaskWidget extends StatefulWidget {
  HouseholdTask task;
  TaskWidget(this.task);

  @override
  _TaskWidgetState createState() => _TaskWidgetState(task);
}

class _TaskWidgetState extends State<TaskWidget> {
  HouseholdTask task;


  _TaskWidgetState(this.task);

  @override
  Widget build(BuildContext context) {
    var info = [task.why, task.how];

    return Scaffold(
      appBar: AppBar(
        title: Text(task.name)
      ),
      body: ListView.builder(
        // I do Not understand padding but whatever
        padding: EdgeInsets.all(17),
        itemCount: info.length,
        itemBuilder: (context, i) {
          return buildRowRow(info[i]);
        },
      )
    );
  }

  Widget buildRowRow (String text) {
    return ListTile(
      title: Text(text)
    );
  }
}
