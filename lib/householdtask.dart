import 'package:flutter/material.dart';
import 'globals.dart';
import 'package:intl/intl.dart';


// Play around with font as you wish - eventually we'll figure out how to make
// font and styling universal.

final formatter = new DateFormat('yyyy-MM-dd');

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
  var dateDue;
  var dateDo;

  // Other things to probably include, but optionally:
    // Recurring
    // Date done
  // If you make some other things non-optional, def update us in
  // task-structure

  /// Takes four arguments - String, String, String, bool - and assigns to
  /// name, why, how, doneCheck. Optional parameters include: {none so far}
  HouseholdTask(this.name, this.why, this.how, this.doneCheck) {
    dateCreated = currDt;
    // IT SHOULD NOT BE CURRDT BUT FOR NOW
    dateDue = currDt;

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

  String dateString() {
    var toret = '';
    if (doneCheck) {
      //var now = DateTime.now();
      //var formatter = new DateFormat('yyyy-MM-dd');
      //String formatted = formatter.format(now);
      String dd = formatter.format(dateDone.last);
      toret = "Done: " + dd;
    } else {
      String dd = formatter.format(dateDue);
      toret = "Due: " + dd;
    }
    return toret;
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


