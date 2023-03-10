import 'package:flutter/material.dart';
import '../nutrition/screens/water_screen.dart';

import '../widgets/my_app_bar.dart';
import '../widgets/star_floating_action_button.dart';

class Nutrition extends StatelessWidget {
  static const routeName = '/nutrition';

  const Nutrition({super.key});
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final MediaQueryData mediaQuery = MediaQuery.of(context);
    return Scaffold(
      appBar: MyAppBar(theme: theme, title: 'Nutrition'),
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Stack(
          children: [
            Positioned(
              top: 200,
              left: 30,
              child: GestureDetector(
                onTap: () {},
                child: Container(
                  height: 220,
                  width: 220,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.pink.shade200,
                    borderRadius: BorderRadius.circular(110),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'My Diet',
                        style: theme.textTheme.headlineMedium,
                      ),
                      Container(
                        width: 140,
                        height: 2,
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        color: Colors.white,
                      ),
                      const SizedBox(
                        width: 160,
                        child: Text(
                          'Here is an information about the diet you are following',
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              top: 100,
              right: 60,
              child: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, WaterScreen.routeName);
                },
                child: Container(
                  height: 120,
                  width: 120,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 28, 21, 62),
                    borderRadius: BorderRadius.circular(60),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        'Water',
                        style: TextStyle(fontWeight: FontWeight.w700),
                        textAlign: TextAlign.center,
                      ),
                      Icon(Icons.water, color: Colors.blue, size: 30)
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 120,
              right: 60,
              child: GestureDetector(
                onTap: () {},
                child: Container(
                  height: 90,
                  width: 90,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.yellow.shade600,
                    borderRadius: BorderRadius.circular(45),
                  ),
                  child: const Text(
                    'Notes',
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
