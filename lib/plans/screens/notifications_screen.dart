// ignore_for_file: unused_field

import 'package:flutter/material.dart';
import 'package:helzy/widgets/my_app_bar.dart';
import 'package:intl/intl.dart';

class NotificationsScreen extends StatefulWidget {
  static const routeName = '/plans/notifications';
  const NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  DateTime _selectedDate = DateTime.now();
  String _chosenTime = DateFormat('HH:mm').format(DateTime.now());
  final Map<DateTime, List<dynamic>> _events = {};
  final List<String> weekdays = [
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday',
    'Sunday',
  ];

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);

    return Scaffold(
      appBar: ChildAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                Container(
                  height: mediaQuery.size.height * 0.4,
                  width: mediaQuery.size.width * 0.9,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: CalendarDatePicker(
                    initialDate: DateTime.now(),
                    firstDate: DateTime(1923, 1, 1),
                    lastDate: DateTime.now(),
                    onDateChanged: (date) {
                      setState(() {
                        _selectedDate = date;
                      });
                    },
                  ),
                ),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      'Choose Day:  ',
                      style: TextStyle(fontSize: 18),
                    ),
                    Text(
                      'Every ${weekdays[_selectedDate.weekday - 1]}',
                      style: TextStyle(
                          decoration: TextDecoration.underline,
                          fontWeight: FontWeight.w700,
                          fontSize: 18),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      'Choose Time:  ',
                      style: TextStyle(fontSize: 18),
                    ),
                    Text(
                      _chosenTime,
                      style: TextStyle(
                          decoration: TextDecoration.underline,
                          fontWeight: FontWeight.w700,
                          fontSize: 18),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                Center(
                    child: ElevatedButton(
                  onPressed: () async {
                    TimeOfDay pickedTime = await showTimePicker(
                      initialTime: TimeOfDay.now(),
                      context: context,
                    ) as TimeOfDay;

                    if (pickedTime != null) {
                      DateTime parsedTime = DateFormat.jm()
                          .parse(pickedTime.format(context).toString());
                      String formattedTime =
                          DateFormat('HH:mm:ss').format(parsedTime);
                      setState(() {
                        _chosenTime = formattedTime;
                      });
                    }
                  },
                  child: const Text('Save'),
                ))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
