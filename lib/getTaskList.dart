import 'package:flutter/material.dart';
import 'householdtask.dart';
//import 'package:shared_preferences/shared_preferences.dart';

// SHALOM'S REALM : DO NOT TOUCH

// Currently, the task list is a list of HouseholdTask and HouseholdTaskList
// objects. You can find the details about them in householdtask.dart, which
// Colin is responsible for.

// Good luck!!

/// This is the official method for getting data from the phone and into the
/// app. This method will be used in main.dart and immediately passed into
/// tasklist.dart.

/*
List getTaskList () {
  return [
    HouseholdTask('Make your bed',
        'You should do this to start your day off on the right foot. Also, '
            'people tend to be more productive and are less likely to get back into bed if their bed is made',
        'Straighten out your bed sheets and comforter. If the sheets have come untucked at the end, tuck them '
            'back in (this might happen more if you’re a restless sleeper)', false,
        recurringArgs: {Symbol("every"): Duration(days: 1)}),
    HouseholdTask('Organize your room',
        'You should do this because an organized room often correlates with an organized mind. '
            'Cleaning your room also decrease the amount of dust mites and bugs, therefore reducing allergies!'
            'Finally, keeping your room clean prevents spills and accidents',
        'Pick up any clothes or clutter off the floor. Tuck in your desk chair. Open your windows to let the air circulate.', false,
        recurringArgs: {Symbol("every"): Duration(days: 3)}),
    HouseholdTask('Organize your desk',
        'It’s way too easy to lose track of important documents/items on a messy desk. '
            'When everything piles up, it takes a while to find any one object or paper on the desk. '
            'When the desk is clean, it gives you more space to work. A crowded desk might mean you '
            'only have enough room for your papers and not your textbook, or vice versa.',
        'Get rid of loose papers: Pick up all the papers, notes, and other loose sheets that are lying around.'
            'Organize your papers: Organize and file the papers you want to keep in binders, folders, or file cabinets. '
            'Throw useless paper away. It is a great idea to reuse paper in different ways if you can.'
            'Organize writing tools: Collect your pens, pencils, and other writing tools and store them in a cup, pencil case, or special drawer.'
            'Clean up your books: Put away any books or magazines that are lying around. Give useless magazines to paper recycling centers.', false,
        recurringArgs: {Symbol("every"): Duration(days: 3)}),
    HouseholdTask('Take out the trash',
        'Bugs and other unwanted pests will come to your room if you leave the trash full for too long. An unpleasant smell may also fill your room.',
        'Take the current bag out to the trash. Replace with a new bag.', false,
        recurringArgs: {Symbol("every"): Duration(days: 3)}),
    HouseholdTask('Do laundry',
        'First, proof by duh: you need clean clothes. Having clean clothes is good for the people around you - prevent strange odors. '
            'Having clean clothes is good for you - (health effects of wearing dirty clothes)',
        'Wash your clothes depending on usage - weekly is fairly good. Learn to use the machines near you (most are coin-operated).'
            'Separate loads by lights/darks, wash at different temperatures: Darks on cold, lights on warm', false,
        recurringArgs: {Symbol("every"): Duration(days: 7)}),
    HouseholdTaskList('Task Folder',
        [
          HouseholdTask('Another task', 'You thought youd seen the last of me', 'not at all!', false),
          HouseholdTask('Yet another??', 'haha', 'Im here', false)
        ], color: Colors.red)
  ];
}
*/

/// This a dummy task list that is currently being used for UI creation
/// purposes.
List getDummyTaskList () {
  return [
    HouseholdTask('Clean counters',
        'You should do this because clean counters make a bathroom much nicer.',
        'Get some paper towels and a spray spray and go ham', false,
        recurringArgs: {Symbol("every"): Duration(days: 2)}),
    HouseholdTask('Clean toilet', 'Dont want nasty bathroom, now do w?e',
        'Get yourself a scrubby scrubby and do it.', false),
    HouseholdTask('Replace sponge', 'You know how nasty those things get?',
        'Go to the store and buy a nice new clean one', false),
    HouseholdTaskList('Task Folder',
        [
          HouseholdTask('Another task', 'You thought youd seen the last of me', 'not at all!', false),
          HouseholdTask('Yet another??', 'haha', 'Im here', false)
        ], color: Colors.red)
  ];
}