import 'package:flutter/material.dart';

import 'householdtask.dart';

// This is where we'll figure out how to get tasks lists into the app.
// Currently a list of householdtasks and householdtasklists. Can change!
List getTaskList () {
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