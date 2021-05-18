import 'householdtask.dart';
import 'package:flutter/material.dart';
import 'globals.dart';

final fontDesc = TextStyle(fontSize: 20);
final fontTask = TextStyle(fontSize: 24, color: Colors.white);

class TaskWidget extends StatefulWidget {
  // When creating the widget, I pass in the task that it's meant to display.
  HouseholdTask task;
  Color taskcolor;
  TaskWidget(this.task, {Color this.taskcolor = Colors.blue});

  // Here, that task gets passed into the state class, which is the only
  // place you should be working in.
  @override
  _TaskWidgetState createState() => _TaskWidgetState(task, taskcolor);
}

class _TaskWidgetState extends State<TaskWidget> {
  // This receives the data that's passed in when instantiating the widget.
  HouseholdTask task;
  Color taskcolor;
  _TaskWidgetState(this.task, this.taskcolor);

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
      appBar: AppBar(
        title: Text(task.name, style: fontTask),
        backgroundColor: taskcolor,
      ),

      // IMPORTANT: ListView is your friend because you can scroll in it,
      // but he's also somewhat a mystery. I only understand how to use the
      // .builder() constructor because of the many, many examples online,
      // and that understanding will eventually make it into the flutter
      // notion document. Another constructor may be more useful.
      body: ListView.builder(
        // I do Not understand padding either.
        padding: EdgeInsets.all(30),
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
    return Container(
        color: taskcolor,
        child: ListTile(
            title: Text(text, style: fontTask)
        )
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
