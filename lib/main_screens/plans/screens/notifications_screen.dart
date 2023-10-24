import 'package:flutter/material.dart';
import 'package:helzy/main_widgets/my_app_bar.dart';
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
    Size size = MediaQuery.of(context).size;

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
                  height: size.height * 0.4,
                  width: size.width * 0.9,
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
                SizedBox(height: size.height / 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      'Choose Day:  ',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    Text(
                      'Every ${weekdays[_selectedDate.weekday - 1]}',
                      style: const TextStyle(
                        decoration: TextDecoration.underline,
                        fontWeight: FontWeight.w700,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      'Choose Time:  ',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    Text(
                      _chosenTime,
                      style: const TextStyle(
                        decoration: TextDecoration.underline,
                        fontWeight: FontWeight.w700,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: size.height / 40),
                Center(
                    child: ElevatedButton(
                  onPressed: () async {
                    TimeOfDay pickedTime = await showTimePicker(
                      initialTime: TimeOfDay.now(),
                      context: context,
                    ) as TimeOfDay;

                    DateTime parsedTime = DateFormat.jm()
                        .parse(pickedTime.format(context).toString());
                    String formattedTime =
                        DateFormat('HH:mm:ss').format(parsedTime);
                    setState(() {
                      _chosenTime = formattedTime;
                    });
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
