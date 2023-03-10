import 'dart:async';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:helzy/widgets/star_floating_action_button.dart';
import 'package:flutter_native_timezone/flutter_native_timezone.dart';
import 'package:timezone/timezone.dart' as tz;

class WaterScreen extends StatefulWidget {
  static const routeName = 'nutrition/water';
  const WaterScreen({super.key});

  @override
  State<WaterScreen> createState() => _WaterScreenState();
}

class _WaterScreenState extends State<WaterScreen> {
  @override
  Widget build(BuildContext context) {
    FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
        FlutterLocalNotificationsPlugin();
    ThemeData theme = Theme.of(context);
    List<String> waterTimes = ['14:00', '16:00', '18:00'];
    void initNotifications() async {
      AndroidInitializationSettings initializationSettingsAndroid =
          const AndroidInitializationSettings('app_icon');

      InitializationSettings initializationSettings = InitializationSettings(
        android: initializationSettingsAndroid,
      );
      await flutterLocalNotificationsPlugin.initialize(initializationSettings);
    }

    List<bool> todayValue = [];
    List<bool> yestardayValue = [];

    void scheduleAlarms() async {
      for (String time in waterTimes) {
        List<String> parts = time.split(':');
        int hours = int.parse(parts[0]);
        int minutes = int.parse(parts[1]);
        DateTime now = DateTime.now();
        DateTime scheduledTime =
            DateTime(now.year, now.month, now.day, hours, minutes);
        if (scheduledTime.isBefore(now)) {
          scheduledTime = scheduledTime.add(const Duration(days: 1));
        }
        AndroidNotificationDetails androidPlatformChannelSpecifics =
            const AndroidNotificationDetails(
          'alarm_channel_id',
          'Alarm',
          importance: Importance.high,
          priority: Priority.high,
          playSound: true,
          sound: RawResourceAndroidNotificationSound('alarm_sound'),
          enableVibration: true,
          channelShowBadge: true,
          visibility: NotificationVisibility.public,
        );
        NotificationDetails platformChannelSpecifics = NotificationDetails(
          android: androidPlatformChannelSpecifics,
        );
        await flutterLocalNotificationsPlugin.zonedSchedule(
          0,
          'Alarm',
          'Wake up!',
          tz.TZDateTime.from(scheduledTime, tz.local),
          platformChannelSpecifics,
          androidAllowWhileIdle: true,
          uiLocalNotificationDateInterpretation:
              UILocalNotificationDateInterpretation.absoluteTime,
          matchDateTimeComponents: DateTimeComponents.time,
        );
      }
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: theme.scaffoldBackgroundColor,
        elevation: 0,
      ),
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Water',
              style: theme.textTheme.headlineLarge,
            ),
            Text(
              'Today',
              style: theme.textTheme.headlineSmall,
            ),
            Text(
              'Yesterday',
              style: theme.textTheme.headlineSmall,
            ),
            TextButton(
                onPressed: () {
                  waterTimes.add('17:00');
                  scheduleAlarms();
                },
                child: Row(
                  children: const [
                    Icon(Icons.add_rounded),
                    Text(
                      'Add',
                      style: TextStyle(fontWeight: FontWeight.w700),
                    ),
                  ],
                ))
          ],
        ),
      ),
      floatingActionButton: const StarFloatingActionButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
    );
  }
}
