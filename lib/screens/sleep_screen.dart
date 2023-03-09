import 'package:flutter/material.dart';

import './star_screen.dart';
import '../widgets/my_app_bar.dart';

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
            const Positioned(
              top: 200,
              right: 20,
              child: Icon(
                Icons.nightlight,
                size: 200,
              ),
            ),
            const Positioned(
              top: 120,
              left: 100,
              child: Icon(
                Icons.nightlight,
                size: 100,
              ),
            ),
            const Positioned(
              bottom: 160,
              left: 150,
              child: Icon(
                Icons.nightlight,
                size: 80,
              ),
            ),
            Positioned(
              bottom: 10,
              left: 10,
              child: GestureDetector(
                onTap: () => Navigator.pushNamed(context, StarScreen.routeName),
                child: SizedBox(
                  height: 40,
                  child: Image.asset('assets/images/star.png'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
