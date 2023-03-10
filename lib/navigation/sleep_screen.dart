import 'package:flutter/material.dart';
import 'package:helzy/sleep/screens/good_night_screen.dart';
import 'package:helzy/sleep/screens/meditation.dart';

import '../sleep/sleep_results_screen.dart';
import '../widgets/my_app_bar.dart';
import '../widgets/star_floating_action_button.dart';

class SleepScreen extends StatelessWidget {
  static const routeName = '/sleep';
  const SleepScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    return Scaffold(
      appBar: MyAppBar(theme: theme, title: 'My Sleep'),
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Stack(
          children: [
            Positioned(
              top: 20,
              right: 20,
              child: GestureDetector(
                child: SizedBox(
                  height: 150,
                  child: Image.asset('assets/images/sleep.png'),
                ),
              ),
            ),
            Positioned(
              top: 200,
              right: 20,
              child: GestureDetector(
                onTap: () =>
                    Navigator.pushNamed(context, SleepResultsScreen.routeName),
                child: Container(
                  height: 200,
                  width: 200,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.yellow.shade600,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Text(
                    'Results',
                    style: theme.textTheme.headlineLarge,
                  ),
                ),
              ),
            ),
            Positioned(
              top: 120,
              left: 100,
              child: GestureDetector(
                onTap: () =>
                    Navigator.pushNamed(context, GoodNightScreen.routeName),
                child: Container(
                  height: 100,
                  width: 100,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.blueGrey.shade900,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Text(
                    'Good Night',
                    style: theme.textTheme.headlineSmall,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 160,
              left: 150,
              child: GestureDetector(
                onTap: () => Navigator.pushNamed(context, Meditation.routeName),
                child: Container(
                  height: 90,
                  width: 90,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.pink.shade300,
                    borderRadius: BorderRadius.circular(45),
                  ),
                  child: const Text(
                    'Meditation',
                    style: TextStyle(fontWeight: FontWeight.w700),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: const StarFloatingActionButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
    );
  }
}
