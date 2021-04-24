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

  var recurringFunc;

  List<DateTime> dateDone = [];
  var dateDue;
  var dateDo;



  /// Takes four arguments - String, String, String, bool - and assigns to
  /// name, why, how, doneCheck. Optional parameters include: {none so far}
  HouseholdTask(this.name, this.why, this.how,
      this.doneCheck, {Map<Symbol, dynamic> recurringArgs}) {
    dateCreated = currDt;
    // IT SHOULD NOT BE CURRDT BUT FOR NOW
    dateDo = currDt;
    dateDue = currDt;

    // If there aren't any recurring args, make the recurring function null
    // otherwise, make the recurring function using the args
    recurringArgs == null ?
      recurringFunc = null :
      recurringFunc = Function.apply(calcNext, [], recurringArgs);

  }


  void changeDone() {
    if (recurringFunc != null) {
      if (doneCheck) {
        doneCheck = false;
      } else {
        doneCheck = true;
        dateDone.add(currDt);
        dateDo = recurringFunc(dateDone);
      }
    } else if (doneCheck) {
      doneCheck = false;
      dateDone.removeLast();
    } else {
      doneCheck = true;
      dateDone.add(currDt);
    }

    // THIS FUNCTION DOES NOT uncheck and stuff
  }

  void update() {
    //will need to uncheck done if recurring time is coming
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
      String dd = formatter.format(dateDo);
      toret = "Do: " + dd;
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


Function calcNext({Duration every = const Duration(days: 1)}) {
  return (List<DateTime> dates) {return dates.last.add(every);};
}