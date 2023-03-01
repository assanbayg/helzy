import 'package:flutter/material.dart';

import './plans_screen.dart';

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
    Center(
      child: Text('Does it work?'),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Scaffold(
      body: screens[selectedIndex],
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
          backgroundColor: theme.primaryColor,
          indicatorColor: theme.scaffoldBackgroundColor,
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
              icon: Icon(Icons.pageview_sharp),
              label: 'Plans',
            ),
            NavigationDestination(
              icon: Icon(Icons.science),
              label: 'Analyses',
            ),
          ],
        ),
      ),
    );
  }
}
