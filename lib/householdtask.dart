import 'package:flutter/material.dart';
import 'globals.dart';
import 'package:intl/intl.dart';


// Play around with font as you wish - eventually we'll figure out how to make
// font and styling universal.

final formatter = new DateFormat('MM-dd');

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

  var lateCount;



  /// Takes four arguments - String, String, String, bool - and assigns to
  /// name, why, how, doneCheck. Optional parameters include: {none so far}
  HouseholdTask(this.name, this.why, this.how,
                this.doneCheck, {Map<Symbol, dynamic> recurringArgs}) {

    dateCreated = currDt;
    // IT SHOULD NOT BE CURRDT BUT FOR NOW
    dateDo = currDt;
    dateDue = currDt;

    lateCount = Duration(days: 0);

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
        dateDo = recurringFunc(dateDone, lateCount);
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

  // Checks if task needs to be unchecked
  void update() {
    if (recurringFunc != null && doneCheck && dateDo.isAtSameMomentAs(currDt)) {
      changeDone();
    }

    lateCount = currDt.difference(dateDo);

  }


  String dateString() {
    var toret = '';
    String dd = '';
    if (doneCheck) {
      dd = formatter.format(dateDone.last);
      toret = "Done: ";
    } else {
      dd = formatter.format(dateDo);
      if (lateCount.compareTo(Duration(days: 0)) > 0) {
        toret = "LATE Do: ";
      } else {
        toret = "Do: ";
      }
    }
    toret += dd;
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


// Returns a function. Make better.
// Closest, not next
// Account for doing it late
// date.weekday returns 1-7
// DateTime.sunday returns 7
Function calcNext({Duration every = const Duration(days: 1),
                  List<int> only = const [1, 2, 3, 4, 5, 6, 7]}) {
  return (List<DateTime> dates, Duration late) {return dates.last.add(every - late);};
}