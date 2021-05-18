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
    HouseholdTask('Change your sheets',
        'As we sleep, our sheets accumulate dead skin cells and mites. Sheets can also accumulate pollen, animal dander, fungi, and bacteria, '
            'as well as our sweat. Basically, there’s a lot of stuff that shows up in our sheets over time that we don’t want to sleep in.',
        'Wash your sheets at least every other week (if you sweat a lot, consider washing every week). Wash sheets and other bedding in hot water '
            '(if sheets instruct you to wash in cold water, try ironing them after to kill off mites without prolonging exposure to heat).'
            'Between washes, make sure you: avoid taking a nap after a sweaty workout, keep pets off the bed, remove debris from socks and/or feet.', false,
        recurringArgs: {Symbol("every"): Duration(days: 7)}),
    HouseholdTask('Wipe down surfaces',
        'Dust on surfaces is bad for aesthetic reasons - it makes everything look worse. However, the main reason is that all the dust on your '
            'surfaces rarely stays on your surfaces. And unless you remove the dust with a cloth or something similar, its next destination is '
            'your lungs. As for objects on surfaces such as shelves, it’s good to take stock of what’s up there every so often so you don’t '
            'spend an hour looking for something the next time you need it.',
        'Grab a microfiber cloth, and start removing dust from your surfaces. Dust from the top down, as while the cloth should trap most of the dust,'
            ' any dust it displaces up top will fall down, and you’ll be able to get it when you dust the lower surfaces. Dampen the cloth before '
            'you start, or spray it with an all-purpose cleaner. Use a dry cloth to dust things like art pieces/collectibles/etc that can’t get wet'
            'For ceilings and such, you might need something with a longer handle.', false,
        recurringArgs: {Symbol("every"): Duration(days: 7)}),
    HouseholdTask('Sweep the room',
        'Remove debris and other things that accumulate on hard floors.',
        'Get a broom, and in a simple mechanical fashion, push it along the floor. Always push in the same direction (either away from you or towards '
            'you) and try to gather all of the floor’s debris in one place. Then, grab a dustpan and sweep all of the debris into the dustpan. '
            'This will take a couple tries. If there’s a line left behind, position the dustpan’s edge perpendicular to the line of debris and '
            'keep trying to get it into the dustpan.', false,
        recurringArgs: {Symbol("every"): Duration(days: 7)}),
    HouseholdTask('Clean bathroom surfaces',
        'Mold and other dirt can grow on bathroom surfaces if they are not properly cleaned. Prevent illness and infection from spreading through '
            'the bacteria. Stay safe - puddles and a cluttered space can lead to injuries',
        'Clean surfaces (bathtub, sink, toilet, floor, etc) with disinfectant/bleach. Wipe up any puddles. Vacuum bath mat. Clean shower curtains '
            'and shower mat.', false,
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
    HouseholdTask('Change your sheets',
        'As we sleep, our sheets accumulate dead skin cells and mites. Sheets can also accumulate pollen, animal dander, fungi, and bacteria, '
            'as well as our sweat. Basically, there’s a lot of stuff that shows up in our sheets over time that we don’t want to sleep in.',
        'Wash your sheets at least every other week (if you sweat a lot, consider washing every week). Wash sheets and other bedding in hot water '
            '(if sheets instruct you to wash in cold water, try ironing them after to kill off mites without prolonging exposure to heat).'
            'Between washes, make sure you: avoid taking a nap after a sweaty workout, keep pets off the bed, remove debris from socks and/or feet.', false,
        recurringArgs: {Symbol("every"): Duration(days: 7)}),
    HouseholdTask('Wipe down surfaces',
        'Dust on surfaces is bad for aesthetic reasons - it makes everything look worse. However, the main reason is that all the dust on your '
            'surfaces rarely stays on your surfaces. And unless you remove the dust with a cloth or something similar, its next destination is '
            'your lungs. As for objects on surfaces such as shelves, it’s good to take stock of what’s up there every so often so you don’t '
            'spend an hour looking for something the next time you need it.',
        'Grab a microfiber cloth, and start removing dust from your surfaces. Dust from the top down, as while the cloth should trap most of the dust,'
            ' any dust it displaces up top will fall down, and you’ll be able to get it when you dust the lower surfaces. Dampen the cloth before '
            'you start, or spray it with an all-purpose cleaner. Use a dry cloth to dust things like art pieces/collectibles/etc that can’t get wet'
            'For ceilings and such, you might need something with a longer handle.', false,
        recurringArgs: {Symbol("every"): Duration(days: 7)}),
    HouseholdTask('Sweep the room',
        'Remove debris and other things that accumulate on hard floors.',
        'Get a broom, and in a simple mechanical fashion, push it along the floor. Always push in the same direction (either away from you or towards '
            'you) and try to gather all of the floor’s debris in one place. Then, grab a dustpan and sweep all of the debris into the dustpan. '
            'This will take a couple tries. If there’s a line left behind, position the dustpan’s edge perpendicular to the line of debris and '
            'keep trying to get it into the dustpan.', false,
        recurringArgs: {Symbol("every"): Duration(days: 7)}),
    HouseholdTask('Clean bathroom surfaces',
        'Mold and other dirt can grow on bathroom surfaces if they are not properly cleaned. Prevent illness and infection from spreading through '
            'the bacteria. Stay safe - puddles and a cluttered space can lead to injuries',
        'Clean surfaces (bathtub, sink, toilet, floor, etc) with disinfectant/bleach. Wipe up any puddles. Vacuum bath mat. Clean shower curtains '
            'and shower mat.', false,
        recurringArgs: {Symbol("every"): Duration(days: 7)}),
    HouseholdTaskList('Task Folder',
        [
          HouseholdTask('Another task', 'You thought youd seen the last of me', 'not at all!', false),
          HouseholdTask('Yet another??', 'haha', 'Im here', false)
        ], color: Colors.red)
  ];
}