import 'package:flutter/material.dart';
import 'package:helzy/screens/meditation.dart';

import './plans_screen.dart';
import './analyse_screen.dart';
import './nutrition.dart';

class NavigationBarScreen extends StatefulWidget {
  static const routeName = '/nav-bar';
  const NavigationBarScreen({super.key});

  @override
  State<NavigationBarScreen> createState() => _NavigationBarScreenState();
}

class _NavigationBarScreenState extends State<NavigationBarScreen> {
  var selectedIndex = 0;
  static const List<Widget> screens = [
    PlansScreen(),
    AnalysesScreen(),
    Meditation(),
    Nutrition(),
  ];

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Scaffold(
      body: screens[selectedIndex],
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
          backgroundColor: theme.primaryColor,
          indicatorColor: Colors.pink.shade700,
          labelTextStyle: MaterialStateProperty.all(
            const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w700,
              fontSize: 12,
            ),
          ),
        ),
        child: NavigationBar(
          height: 70,
          selectedIndex: selectedIndex,
          onDestinationSelected: (index) =>
              setState(() => selectedIndex = index),
          destinations: const [
            NavigationDestination(
              icon: Icon(
                Icons.pageview_sharp,
                color: Colors.white,
              ),
              label: 'Plans',
            ),
            NavigationDestination(
              icon: Icon(
                Icons.science,
                color: Colors.white,
              ),
              label: 'Analyses',
            ),
            NavigationDestination(
              icon: Icon(
                Icons.self_improvement_rounded,
                color: Colors.white,
              ),
              label: 'Meditation',
            ),
            NavigationDestination(
              icon: Icon(
                Icons.restaurant,
                color: Colors.white,
              ),
              label: 'Nutrition',
            ),
          ],
        ),
      ),
    );
  }
}
