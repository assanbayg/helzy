// ignore_for_file: unused_field

import 'package:flutter/material.dart';
import 'package:helzy/widgets/my_app_bar.dart';

class NotificationsScreen extends StatefulWidget {
  static const routeName = '/plans/notifications';
  const NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  final DateTime _selectedDate = DateTime.now();
  final Map<DateTime, List<dynamic>> _events = {};

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
                    onDateChanged: (date) {},
                  ),
                ),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: const [
                    Text(
                      'Choose Day:  ',
                      style: TextStyle(fontSize: 18),
                    ),
                    Text(
                      'Every Wednesday',
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
                  children: const [
                    Text(
                      'Choose Time:  ',
                      style: TextStyle(fontSize: 18),
                    ),
                    Text(
                      '17:00',
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
                        onPressed: () {}, child: const Text('Save')))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
