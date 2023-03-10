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
    MediaQueryData mediaQueryData = MediaQuery.of(context);

    return Scaffold(
      appBar: MyAppBar(theme: theme, title: 'My Sleep'),
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Stack(
          children: [
            Positioned(
              top: mediaQueryData.size.height * 0.025,
              right: mediaQueryData.size.height * 0.025,
              child: GestureDetector(
                child: SizedBox(
                  height: mediaQueryData.size.height * 0.175,
                  child: Image.asset('assets/images/sleep.png'),
                ),
              ),
            ),
            Positioned(
              top: mediaQueryData.size.height * 0.25,
              //top: 200,
              right: 20,
              child: GestureDetector(
                onTap: () =>
                    Navigator.pushNamed(context, SleepResultsScreen.routeName),
                child: Container(
                  height: mediaQueryData.size.height * 0.25,
                  width: mediaQueryData.size.height * 0.25,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.yellow.shade600,
                    shape: BoxShape.circle,
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
                  height: 120,
                  width: 120,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    shape: BoxShape.circle,
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
              bottom: mediaQueryData.size.width * 0.4,
              left: 100,
              child: GestureDetector(
                onTap: () => Navigator.pushNamed(context, Meditation.routeName),
                child: Container(
                  height: 90,
                  width: 90,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.red.shade300,
                    shape: BoxShape.circle,
                  ),
                  child: const Text(
                    'Meditation',
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 14),
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
