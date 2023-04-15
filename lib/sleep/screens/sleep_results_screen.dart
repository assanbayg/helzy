import 'package:flutter/material.dart';
import 'package:helzy/widgets/my_app_bar.dart';

import '../widgets/sleep_hours_line_chart.dart';

class SleepResultsScreen extends StatefulWidget {
  static const routeName = '/sleep/results';
  const SleepResultsScreen({super.key});

  @override
  State<SleepResultsScreen> createState() => _SleepResultsScreenState();
}

class _SleepResultsScreenState extends State<SleepResultsScreen> {
  @override
  Widget build(BuildContext context) {
    List<double> sleepHours = [8, 4, 11, 5.6, 6.7, 8, 8];
    double avgSleep =
        sleepHours.reduce((value, element) => value + element) / 7;

    ThemeData theme = Theme.of(context);
    return Scaffold(
      appBar: ChildAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(14),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Results',
                style: theme.textTheme.headlineLarge,
              ),
              const Text(
                'Goal: 7 hours',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  decoration: TextDecoration.underline,
                ),
              ),
              Container(
                padding: const EdgeInsets.only(left: 30),
                margin: const EdgeInsets.symmetric(vertical: 30),
                width: double.infinity,
                height: 300,
                child: SleepHoursLineChart(
                  sleepHours: sleepHours,
                ),
              ),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Average sleeping time: ${avgSleep.floor()}h ${((avgSleep - avgSleep.floor()) * 60).round()}min.',
                      style: const TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      'Today: ${sleepHours[DateTime.now().weekday].floor()}h ${((sleepHours[DateTime.now().weekday] - sleepHours[DateTime.now().weekday]) * 60).round()}min.',
                      style: const TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      'Yesterday: ${sleepHours[DateTime.now().weekday - 1].floor()}h ${((sleepHours[DateTime.now().weekday - 1] - sleepHours[DateTime.now().weekday - 1]) * 60).round()}min.',
                      style: const TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    ElevatedButton(
                        onPressed: () {},
                        child: const Text(
                          'Add time',
                          style: TextStyle(color: Colors.black),
                        )),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
