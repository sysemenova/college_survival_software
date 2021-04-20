import 'package:flutter/material.dart';
import 'globals.dart';

// COLIN'S REALM : DO NOT TOUCH

// Play around with font as you wish - eventually we'll figure out how to make
// font and styling universal.
final fontDesc = TextStyle(fontSize: 20);
final fontTask = TextStyle(fontSize: 24);

//final dateFormat = DateFormat("");

/// This class holds data for the household tasks. It has no methods other than
/// changeDone(), which flips the value of
class HouseholdTask {
  String name, why, how;
  var doneCheck;
  var dateCreated;
  //var recurring;
  // var recurringGap;
  var dateDone = [];

  // Other things to probably include, but optionally:
    // Recurring
    // Date done
  // If you make some other things non-optional, def update us in
  // task-structure

  /// Takes four arguments - String, String, String, bool - and assigns to
  /// name, why, how, doneCheck. Optional parameters include: {none so far}
  HouseholdTask(this.name, this.why, this.how, this.doneCheck) {
    dateCreated = currDt;
  }

  // A cool use case of the short if statement. The => just means it's a
  // one line function.
  void changeDone() {
    if (doneCheck) {
      doneCheck = false;
      dateDone.removeLast();
    } else {
      doneCheck = true;
      dateDone.add(currDt);
    }
  }
}


/// Class to hold data for a list of task lists. Has a name of the list and
/// a lists of tasks (which can include another list of tasks).
class HouseholdTaskList {
  String name;
  List tasks;
  Color color;

  HouseholdTaskList(this.name, this.tasks, {this.color: Colors.blue});
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

    //did I have to do this? no
    //did I want to do this? no
    //is this first way I thought of to make sure line 74 isn't too long?
    //unfortunately, yes
    var wString = "Why Do I Need To Do This?";
    var hString = "How Do I Do This?";

    var info = [wString, task.why, hString, task.how, task.doneCheck];

    return Scaffold(
        appBar: AppBar(title: Text(task.name, style: fontTask)),

        // IMPORTANT: ListView is your friend because you can scroll in it,
        // but he's also somewhat a mystery. I only understand how to use the
        // .builder() constructor because of the many, many examples online,
        // and that understanding will eventually make it into the flutter
        // notion document. Another constructor may be more useful.
        body: ListView.builder(
            // I do Not understand padding either.
            padding: EdgeInsets.all(20),
            itemCount: info.length,

            // Anonymous function (context, i) {} where the {} has to return
            // a list tile. I think.
            itemBuilder: (context, i) {
              //return buildRow(info[i]);
              if (i == 0 || i == 2) {
                return buildRowHeader(info[i]);
              } else if (i != 4) {
                return buildRowText(info[i]);
              } else {
                return buildRowCheckbox(info[i]);
              }
            },
          ),

        );
  }

  // if (statement) { execute1 } else { execute2 }
  // statement ? exectue1 : execute 2;


  /// Builds a row of the ListView widget. If the information is text, makes
  /// a plan ListTile with text in it. If the information is boolean, makes a
  /// CheckboxListTile. This can be played with.
  Widget buildRow(text) {
    return text is String
        ? ListTile(
          title: Text(text, style: fontDesc)
        )
        : CheckboxListTile(
            title: Text("Done?"),
            value: text,
            onChanged: (value) {
              setState(() {
                task.changeDone();
              });
            }
            );
  }

  Widget buildRowHeader(text) {
    return ListTile(
      title: Text(text, style: fontTask)
    );
  }

  Widget buildRowText(text) {
    return ListTile(
        title: Text(text, style: fontDesc)
    );
  }

  Widget buildRowCheckbox(val) {
    return CheckboxListTile(
        title: Text("Done?"),
        value: val,
        onChanged: (value) {
          setState(() {
            task.changeDone();
          });
        }
    );
  }
}
