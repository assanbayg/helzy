import 'package:flutter/material.dart';
import 'package:helzy/widgets/my_drawer.dart';

import 'package:helzy/navigation/sleep_screen.dart';
import 'package:helzy/navigation/plans_screen.dart';
import 'package:helzy/navigation/content_screen.dart';
import 'package:helzy/file_management/analyses_screen.dart';
import 'package:helzy/navigation/habits_screen.dart';

class NavigationBarScreen extends StatefulWidget {
  static const routeName = '/nav-bar';
  const NavigationBarScreen({super.key});

  @override
  State<NavigationBarScreen> createState() => _NavigationBarScreenState();
}

class _NavigationBarScreenState extends State<NavigationBarScreen> {
  int selectedIndex = 0;
  static List<Widget> screens = const [
    AnalysesScreen(),
    SleepScreen(),
    PlansScreen(),
    HabitsScreen(),
    ContentScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double navigationBarIconSize = size.width * 0.075;

    return Scaffold(
      body: screens[selectedIndex],
      drawer: const MyDrawer(),
      bottomNavigationBar: Container(
        height: size.height * 0.1,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(30),
            topLeft: Radius.circular(30),
          ),
          boxShadow: [
            BoxShadow(color: Colors.black38, spreadRadius: 0, blurRadius: 10),
          ],
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
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
                icon: NavigationBarIcon(
                  context: context,
                  icon: 'assets/images/analyses_icon.png',
                  size: navigationBarIconSize,
                ),
                label: 'Analyses',
              ),
              BottomNavigationBarItem(
                icon: NavigationBarIcon(
                  context: context,
                  icon: 'assets/images/sleep_icon.png',
                  size: navigationBarIconSize,
                ),
                label: 'Sleep',
              ),
              BottomNavigationBarItem(
                icon: Container(
                  padding: EdgeInsets.all(navigationBarIconSize / 5),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Theme.of(context).scaffoldBackgroundColor,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.add_rounded,
                    size: size.width * 0.1,
                    color: Colors.white,
                  ),
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: NavigationBarIcon(
                  context: context,
                  icon: 'assets/images/habits.png',
                  size: navigationBarIconSize,
                ),
                label: 'Nutrition',
              ),
              BottomNavigationBarItem(
                icon: NavigationBarIcon(
                  context: context,
                  icon: 'assets/images/content_icon.png',
                  size: navigationBarIconSize,
                ),
                label: 'Content',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class NavigationBarIcon extends StatelessWidget {
  const NavigationBarIcon({
    super.key,
    required this.context,
    required this.icon,
    required this.size,
  });

  final BuildContext context;
  final String icon;
  final double size;

  @override
  Widget build(BuildContext context) {
    return ImageIcon(
      AssetImage(icon),
      color: Theme.of(context).scaffoldBackgroundColor,
      size: size,
    );
  }
}
