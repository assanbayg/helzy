import 'package:flutter/material.dart';

import 'navigation/sleep_screen.dart';
import 'navigation/plans_screen.dart';
import 'navigation/analyse_screen.dart';
import 'navigation/habits_screen.dart';
import 'navigation/content_screen.dart';

class NavigationBarScreen extends StatefulWidget {
  static const routeName = '/nav-bar';
  const NavigationBarScreen({super.key});

  @override
  State<NavigationBarScreen> createState() => _NavigationBarScreenState();
}

class _NavigationBarScreenState extends State<NavigationBarScreen> {
  var selectedIndex = 0;
  static const List<Widget> screens = [
    AnalysesScreen(),
    SleepScreen(),
    PlansScreen(),
    HabitsScreen(),
    ContentScreen(),
  ];

  Widget buildIcon(String icon) {
    return ImageIcon(
      AssetImage(icon),
      color: Theme.of(context).scaffoldBackgroundColor,
      size: 35,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[selectedIndex],
      bottomNavigationBar: Container(
        height: 76,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(30), topLeft: Radius.circular(30)),
          boxShadow: [
            BoxShadow(color: Colors.black38, spreadRadius: 0, blurRadius: 10),
          ],
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30.0),
            topRight: Radius.circular(30.0),
          ),
          child: BottomNavigationBar(
            showSelectedLabels: false,
            showUnselectedLabels: false,
            currentIndex: selectedIndex,
            unselectedItemColor: Colors.black,
            selectedIconTheme:
                IconThemeData(color: Theme.of(context).primaryColor),
            onTap: (value) => setState(() {
              selectedIndex = value;
            }),
            items: [
              BottomNavigationBarItem(
                  icon: buildIcon('assets/images/analyses_icon.png'),
                  label: 'Analyses'),
              BottomNavigationBarItem(
                icon: buildIcon('assets/images/sleep_icon.png'),
                label: 'Sleep',
              ),
              BottomNavigationBarItem(
                  icon: Container(
                      padding: const EdgeInsets.all(2),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Theme.of(context).scaffoldBackgroundColor,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.add_rounded,
                        size: 40,
                        color: Colors.white,
                      )),
                  label: ''),
              BottomNavigationBarItem(
                icon: buildIcon('assets/images/habits.png'),
                label: 'Nutrition',
              ),
              BottomNavigationBarItem(
                icon: buildIcon('assets/images/content_icon.png'),
                label: 'Content',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
