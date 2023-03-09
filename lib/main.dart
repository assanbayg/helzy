import 'package:flutter/material.dart';
import 'package:helzy/theme.dart';

import './screens/navigation_bar.dart';
import './screens/main_screen.dart';
import 'screens/auth_screens/login_screen.dart';
import 'screens/auth_screens/sign_up_screen.dart';
import 'screens/auth_screens/policy_screen.dart';
import 'screens/nav_bar_screens/plans_screen.dart';
import 'screens/nav_bar_screens/analyse_screen.dart';
import 'screens/nav_bar_screens/sleep_screens/meditation.dart';
import 'screens/nav_bar_screens/nutrition.dart';
import 'screens/nav_bar_screens/sleep_screen.dart';
import 'screens/nav_bar_screens/content_screen.dart';
import './screens/notifications_screen.dart';
import 'screens/nav_bar_screens/sleep_screens/star_screen.dart';
import 'screens/nav_bar_screens/sleep_screens/my_stars_screen.dart';
import 'screens/nav_bar_screens/sleep_screens/sleep_results_screen.dart';
import 'screens/nav_bar_screens/sleep_screens/good_night_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: basisTheme(),
      home: const MainScreen(),
      initialRoute: '/',
      routes: {
        NavigationBarScreen.routeName: (context) => const NavigationBarScreen(),
        LoginScreen.routeName: (context) => const LoginScreen(),
        SignUpScreen.routeName: (context) => const SignUpScreen(),
        PolicyScreen.routeName: (context) => const PolicyScreen(),
        PlansScreen.routeName: (context) => const PlansScreen(),
        AnalysesScreen.routeName: (context) => const AnalysesScreen(),
        Meditation.routeName: (context) => const Meditation(),
        Nutrition.routeName: (context) => const Nutrition(),
        SleepScreen.routeName: (context) => const SleepScreen(),
        ContentScreen.routeName: (context) => const ContentScreen(),
        NotificationsScreen.routeName: (context) => const NotificationsScreen(),
        StarScreen.routeName: (context) => const StarScreen(),
        HelzyStarsScreen.routeName: (context) => const HelzyStarsScreen(),
        SleepResultsScreen.routeName: (context) => const SleepResultsScreen(),
        GoodNightScreen.routeName: (context) => const GoodNightScreen(),
      },
    );
  }
}
