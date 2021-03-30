import 'package:flutter/material.dart';
import 'householdtask.dart';

class TaskList extends StatefulWidget {
  var tasks = <HouseholdTask>[];
  TaskList(this.tasks);

  @override
  _TaskListState createState() => _TaskListState(tasks);
}

class _TaskListState extends State<TaskList> {
  var tasks = <HouseholdTask>[];
  _TaskListState(this.tasks);

  @override
  Widget build(BuildContext context) {

    return ListView.builder(
      itemCount: tasks.length,
      padding: EdgeInsets.all(17),
      itemBuilder: (context, i) {
        return buildRow(tasks[i]);
      }
    );
  }

  Widget buildRow (HouseholdTask task) {
    return ListTile (
      title: Text(task.name),
      // How the hell does padding work lmao
      onTap: () {
        pushTask(task);
      }
    );
  }

  void pushTask(task) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => TaskWidget(task))
    );
  }
}



