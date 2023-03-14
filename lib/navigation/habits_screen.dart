import 'package:flutter/material.dart';
import 'package:helzy/habits/screens/diary_screen.dart';
import 'package:helzy/habits/screens/my_diet_screen.dart';
import '../habits/screens/steps_screen.dart';
import '../habits/screens/water_screen.dart';

import '../widgets/my_app_bar.dart';
import '../widgets/star_floating_action_button.dart';

class HabitsScreen extends StatelessWidget {
  static const routeName = '/nutrition';

  const HabitsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final MediaQueryData mediaQuery = MediaQuery.of(context);
    return Scaffold(
      appBar: MyAppBar(theme: theme, title: 'Habits'),
      body: Container(
        padding: const EdgeInsets.all(20),
        height: double.infinity,
        width: double.infinity,
        child: Stack(
          children: [
            Positioned(
              top: 20,
              left: 20,
              child: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, StepsScreen.routeName);
                },
                child: Container(
                  height: 110,
                  width: 110,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(55),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Steps',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 18,
                          color: Colors.green.shade700,
                        ),
                      ),
                      SizedBox(
                          height: 35,
                          child: Image.asset('assets/images/steps_icon.png')),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              top: 60,
              right: 0,
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
                    children: [
                      const Text(
                        'Water',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 18,
                        ),
                      ),
                      SizedBox(
                          height: 35,
                          child: Image.asset('assets/images/water.png')),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              top: 160,
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).pushNamed(MyDietScreen.routeName);
                },
                child: Container(
                  height: mediaQuery.size.width * 0.55,
                  width: mediaQuery.size.width * 0.55,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Colors.red.shade200, shape: BoxShape.circle),
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
            // Positioned(
            //   bottom: 180,
            //   right: 20,
            //   child: GestureDetector(
            //     onTap: () {},
            //     child: Container(
            //       height: 100,
            //       width: 100,
            //       alignment: Alignment.center,
            //       decoration: BoxDecoration(
            //         color: Colors.yellow.shade600,
            //         borderRadius: BorderRadius.circular(50),
            //       ),
            //       child: Column(
            //         mainAxisAlignment: MainAxisAlignment.center,
            //         children: [
            //           const Text(
            //             'Exercise',
            //             style: TextStyle(fontWeight: FontWeight.w700),
            //             textAlign: TextAlign.center,
            //           ),
            //           SizedBox(
            //             height: 40,
            //             child: Image.asset('assets/images/exercise_icon.png'),
            //           ),
            //         ],
            //       ),
            //     ),
            //   ),
            // ),
            Positioned(
              bottom: 60,
              left: 40,
              child: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, DiaryScreen.routeName);
                },
                child: Container(
                  height: 170,
                  width: 170,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(134, 132, 255, 1),
                    borderRadius: BorderRadius.circular(85),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text('My Diary', style: theme.textTheme.headlineSmall),
                      Container(
                        width: 80,
                        height: 1,
                        margin: const EdgeInsets.symmetric(vertical: 5),
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 120,
                        child: Text(
                          'Here is information about your emotions and feelings',
                          style: theme.textTheme.bodySmall,
                        ),
                      ),
                    ],
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
