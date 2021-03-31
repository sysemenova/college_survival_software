import 'package:flutter/material.dart';
import 'householdtask.dart';

// SHALOM'S REALM : DO NOT TOUCH

// Currently, the task list is a list of HouseholdTask and HouseholdTaskList
// objects. You can find the details about them in householdtask.dart, which
// Colin is responsible for.

// Good luck!!

/// This is the official method for getting data from the phone and into the
/// app. This method will be used in main.dart and immediately passed into
/// tasklist.dart.
List getTaskList () {
  return [];
}

/// This a dummy task list that is currently being used for UI creation
/// purposes.
List getDummyTaskList () {
  return [
    HouseholdTask('Clean counters',
        'You should do this because clean counters make a bathroom much nicer.',
        'Get some paper towels and a spray spray and go ham', false),
    HouseholdTask('Clean toilet', 'Dont want nasty poor, now do we',
        'Get yourself a scrubby scrubby and do it.', true),
    HouseholdTask('Replace sponge', 'You know how nasty those things get?',
        'Go to the store and buy one you nasty piece of shit', false),
    HouseholdTaskList('Test Name',
        [
          HouseholdTask('Another task', 'You thought youd seen the last of me', 'not at all bitch', false),
          HouseholdTask('Yet another??', 'haha', 'Im here', false)
        ])
  ];
}