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
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: MyAppBar(theme: theme, title: 'Habits'),
      body: Container(
        padding: EdgeInsets.all(size.height / 50),
        height: double.infinity,
        width: double.infinity,
        child: Stack(
          children: [
            Positioned(
              top: size.height / 50,
              left: size.height / 50,
              child: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, StepsScreen.routeName);
                },
                child: Container(
                  height: size.height / 10,
                  width: size.height / 10,
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
                          height: size.height / 30,
                          child: Image.asset('assets/images/steps_icon.png')),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              top: size.height / 15,
              right: 0,
              child: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, WaterScreen.routeName);
                },
                child: Container(
                  height: size.height / 8,
                  width: size.height / 8,
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
                          height: size.height / 30,
                          child: Image.asset('assets/images/water.png')),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              top: size.height / 6.5,
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).pushNamed(MyDietScreen.routeName);
                },
                child: Container(
                  height: size.width * 0.55,
                  width: size.width * 0.55,
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
                        width: size.height * 0.2,
                        height: 2,
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: size.height * 0.2,
                        child: const Text(
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
              bottom: size.height / 5,
              right: size.height / 50,
              child: GestureDetector(
                onTap: () {},
                child: Container(
                  height: size.height * 0.125,
                  width: size.height * 0.125,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.yellow.shade600,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Exercise',
                        style: TextStyle(fontWeight: FontWeight.w700),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: size.height / 24,
                        child: Image.asset('assets/images/exercise_icon.png'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: size.height / 15,
              left: size.height / 25,
              child: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, DiaryScreen.routeName);
                },
                child: Container(
                  height: size.height / 6,
                  width: size.height / 6,
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
                        width: size.height / 10,
                        height: 1,
                        margin: const EdgeInsets.symmetric(vertical: 5),
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: size.height * 0.125,
                        child: Text(
                          'Here is information about your emotions and feelings',
                          style: theme.textTheme.bodySmall,
                          textAlign: TextAlign.center,
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
