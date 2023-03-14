import 'package:flutter/material.dart';
import 'package:helzy/providers/helzy_star.dart';
import 'package:provider/provider.dart';

import 'widgets/sleep_hours_line_chart.dart';

class SleepResultsScreen extends StatefulWidget {
  static const routeName = '/sleep/results';
  const SleepResultsScreen({super.key});

  @override
  State<SleepResultsScreen> createState() => _SleepResultsScreenState();
}

class _SleepResultsScreenState extends State<SleepResultsScreen> {
  @override
  Widget build(BuildContext context) {
    List<double> sleepHours = Provider.of<Sleep>(context).sleepHours;
    double todaySleep = 0;
    double avgSleep =
        sleepHours.reduce((value, element) => value + element) / 7;

    ThemeData theme = Theme.of(context);
    return Scaffold(
      appBar:
          AppBar(backgroundColor: theme.scaffoldBackgroundColor, elevation: 0),
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
                  ],
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return SimpleDialog(
                        title: Text('Today I slept... hours'),
                        children: [
                          SimpleDialogOption(
                            child: TextField(
                              keyboardType: TextInputType.number,
                              onSubmitted: (value) {
                                setState(() {
                                  todaySleep = double.parse(value);
                                  Provider.of<Sleep>(context, listen: false)
                                      .addNew(todaySleep);
                                });
                                Navigator.of(context, rootNavigator: true)
                                    .pop();
                              },
                            ),
                          ),
                        ],
                      );
                    },
                  );
                },
                child: Text('Add'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
