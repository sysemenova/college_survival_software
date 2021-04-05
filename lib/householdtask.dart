import 'package:flutter/material.dart';

// COLIN'S REALM : DO NOT TOUCH

// Play around with font as you wish - eventually we'll figure out how to make
// font and styling universal.
final fontDesc = TextStyle(fontSize: 20);
final fontTask = TextStyle(fontSize: 30);

/// This class holds data for the household tasks. It has no methods other than
/// changeDone(), which flips the value of
class HouseholdTask {
  String name, why, how;
  var doneCheck;
  // Other things to probably include, but optionally:
    // Recurring
    // Date done
  // If you make some other things non-optional, def update us in
  // task-structure

  /// Takes four arguments - String, String, String, bool - and assigns to
  /// name, why, how, doneCheck. Optional parameters include: {NONE}
  HouseholdTask(this.name, this.why, this.how, this.doneCheck);

  // A cool use case of the short if statement. The => just means it's a
  // one line function.
  void changeDone() => doneCheck ? doneCheck = false : doneCheck = true;
}


/// Class to hold data for a list of task lists. Has a name of the list and
/// a lists of tasks (which can include another list of tasks).
class HouseholdTaskList {
  String name;
  List tasks;

  HouseholdTaskList(this.name, this.tasks);
}




class TaskWidget extends StatefulWidget {
  // When creating the widget, I pass in the task that it's meant to display.
  HouseholdTask task;
  TaskWidget(this.task);

  // Here, that task gets passed into the state class, which is the only
  // place you should be working in.
  @override
  _TaskWidgetState createState() => _TaskWidgetState(task);
}

class _TaskWidgetState extends State<TaskWidget> {
  // This receives the data that's passed in when instantiating the widget.
  HouseholdTask task;
  _TaskWidgetState(this.task);

  // build() will pass back a scaffold widget, which will have everything
  // inside. Important place to play!!
  @override
  Widget build(BuildContext context) {
    // Only reason this exists is because I don't know how to use the
    // ListView widget well. See below.
    var info = [task.why, task.how, task.doneCheck];

    return Scaffold(
        appBar: AppBar(title: Text(task.name, style: fontTask)),

        // IMPORTANT: ListView is your friend because you can scroll in it,
        // but he's also somewhat a mystery. I only understand how to use the
        // .builder() constructor because of the many, many examples online,
        // and that understanding will eventually make it into the flutter
        // notion document. Another constructor may be more useful.
        body: ListView.builder(
            // I do Not understand padding either.
            padding: EdgeInsets.all(17),
            itemCount: info.length,

            // Anonymous function (context, i) {} where the {} has to return
            // a list tile. I think.
            itemBuilder: (context, i) {
              return buildRow(info[i]);
            },
          ),

        );
  }

  /// Builds a row of the ListView widget. If the information is text, makes
  /// a plan ListTile with text in it. If the information is boolean, makes a
  /// CheckboxListTile. This can be played with.
  Widget buildRow(text) {
    return text is String
        ? ListTile(title: Text(text, style: fontDesc))
        : CheckboxListTile(
            title: Text("Done?"),
            value: text,
            onChanged: (value) {
              setState(() {
                task.changeDone();
              });
            });
  }
}
