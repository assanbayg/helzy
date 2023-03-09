import 'package:flutter/material.dart';

import 'nav_bar_screens/sleep_screen.dart';
import 'nav_bar_screens/plans_screen.dart';
import 'nav_bar_screens/analyse_screen.dart';
import 'nav_bar_screens/nutrition.dart';
import 'nav_bar_screens/content_screen.dart';

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
    Nutrition(),
    ContentScreen(),
  ];

  Widget buildIcon(String title, String icon) {
    return NavigationDestination(
      icon: ImageIcon(AssetImage(icon)),
      label: title,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: screens[selectedIndex],
        bottomNavigationBar: Container(
          height: 65,
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
              currentIndex: selectedIndex,
              unselectedItemColor: Colors.black,
              selectedItemColor: Theme.of(context).primaryColor,
              onTap: (value) => setState(() {
                selectedIndex = value;
              }),
              items: const [
                BottomNavigationBarItem(
                    icon: ImageIcon(
                      AssetImage('assets/images/analyses_icon.png'),
                    ),
                    label: 'Analyses'),
                BottomNavigationBarItem(
                  icon: ImageIcon(
                    AssetImage('assets/images/sleep_icon.png'),
                  ),
                  label: 'Sleep',
                ),
                BottomNavigationBarItem(
                    icon: ImageIcon(
                      AssetImage('assets/images/plans_icon.png'),
                    ),
                    label: 'Plans'),
                BottomNavigationBarItem(
                  icon: ImageIcon(
                    AssetImage('assets/images/nutrition_icon.png'),
                  ),
                  label: 'Nutrition',
                ),
                BottomNavigationBarItem(
                  icon: ImageIcon(
                    AssetImage('assets/images/content_icon.png'),
                  ),
                  label: 'Content',
                ),
              ],
            ),
          ),
        )
        // NavigationBarTheme(
        //   data: NavigationBarThemeData(
        //     backgroundColor: Colors.white,
        //     indicatorColor: Colors.grey.shade300,
        //     labelTextStyle: MaterialStateProperty.all(
        //       const TextStyle(
        //         color: Colors.black,
        //         fontWeight: FontWeight.w700,
        //         fontSize: 12,
        //       ),
        //     ),
        //   ),
        //   child:

        // NavigationBar(
        //   height: 70,
        //   selectedIndex: selectedIndex,
        //   onDestinationSelected: (index) =>
        //       setState(() => selectedIndex = index),
        //   destinations: [
        //     buildIcon('Analyses', 'assets/images/analyses_icon.png'),
        //     buildIcon('Sleep', 'assets/images/sleep_icon.png'),
        //     buildIcon('Plans', 'assets/images/plans_icon.png'),
        //     buildIcon('Nutrition', 'assets/images/nutrition_icon.png'),
        //     buildIcon('Content', 'assets/images/content_icon.png')
        //   ],
        //     ),
//      ),
        );
  }
}
