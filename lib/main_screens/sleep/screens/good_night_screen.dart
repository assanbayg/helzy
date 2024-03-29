// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:helzy/main_widgets/my_app_bar.dart';
import 'package:intl/intl.dart';
import '../../../main_widgets/star_floating_action_button.dart';

class GoodNightScreen extends StatelessWidget {
  static const routeName = '/sleep/good-night';
  const GoodNightScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var now = DateTime.now();
    var formatter = DateFormat('HH:mm');

    ThemeData theme = Theme.of(context);
    return Scaffold(
      appBar: const ChildAppBar(),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Text(
                'Goal: 7 hours',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  decoration: TextDecoration.underline,
                ),
              ),
              Text(
                'Alarm',
                style: theme.textTheme.headlineLarge,
              ),
              Text(
                '06:00',
                style: theme.textTheme.displayLarge,
              ),
              ElevatedButton(
                onPressed: () {},
                child: const Text('Start'),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.4,
                height: MediaQuery.of(context).size.width * 0.4,
                alignment: Alignment.center,
                child: Column(
                  children: [
                    SizedBox(
                        height: 40,
                        child: Image.asset('assets/images/alarm.png')),
                    const Text(
                      'Wake-up interval\n15 min',
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
      floatingActionButton: const StarFloatingActionButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
    );
  }
}
