import 'dart:async';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:intl/intl.dart';
import 'package:flutter_native_timezone/flutter_native_timezone.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:flutter/material.dart';
import '../../widgets/star_floating_action_button.dart';
import '../../widgets/my_app_bar.dart' show ChildAppBar;

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
    List<bool> todayTimes = [false, false, false];
    List<bool> yesterdayTimes = [false, false, false];

    void initNotifications() async {
      AndroidInitializationSettings initializationSettingsAndroid =
          const AndroidInitializationSettings('app_icon');

      InitializationSettings initializationSettings = InitializationSettings(
        android: initializationSettingsAndroid,
      );
      await flutterLocalNotificationsPlugin.initialize(initializationSettings);
    }

    void scheduleAlarms() async {
      todayTimes = [];
      yesterdayTimes = [];
      for (int i = 0; i < waterTimes.length; i++) {
        todayTimes.add(false);
        yesterdayTimes.add(false);

        String time = waterTimes[i];
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

    @override
    initState() {
      initNotifications();
      super.initState();
    }

    return Scaffold(
      appBar: ChildAppBar(),
      body: Stack(children: [
        Positioned(
          bottom: 60,
          left: 80,
          child: Image.asset('assets/images/water.png',
              opacity: const AlwaysStoppedAnimation(0.5)),
        ),
        Container(
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
              SizedBox(
                width: double.infinity,
                height: 180,
                child: ListView.builder(
                    itemCount: waterTimes.length,
                    itemBuilder: (BuildContext context, index) => Row(
                          children: [
                            Checkbox(
                                value: todayTimes[index],
                                onChanged: (val) => val != val),
                            Text(waterTimes[index]),
                          ],
                        )),
              ),
              Text(
                'Yesterday',
                style: theme.textTheme.headlineSmall,
              ),
              SizedBox(
                width: double.infinity,
                height: 180,
                child: ListView.builder(
                    itemCount: waterTimes.length,
                    itemBuilder: (BuildContext context, index) => Row(
                          children: [
                            Checkbox(
                                value: yesterdayTimes[index],
                                onChanged: (val) => val != val),
                            Text(waterTimes[index]),
                          ],
                        )),
              ),
              TextButton(
                  onPressed: () {
                    setState(() {
                      waterTimes.add('23:00');
                      todayTimes.add(false);
                      yesterdayTimes.add(false);
                      scheduleAlarms();
                    });
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
      ]),
      floatingActionButton: const StarFloatingActionButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
    );
  }
}
