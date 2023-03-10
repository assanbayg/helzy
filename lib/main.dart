import 'package:flutter/material.dart';
import 'package:helzy/habits/screens/diary_screen.dart';
import 'package:helzy/plans/screens/treatment_screen.dart';
import 'package:provider/provider.dart';
import 'habits/screens/steps_screen.dart';
import 'theme.dart';

import 'navigation_bar.dart';
import 'star_screen.dart';

import 'providers/helzy_star.dart';
import 'providers/video.dart';
import 'providers/content.dart';

import 'auth/main_screen.dart';
import 'auth/login_screen.dart';
import 'auth/sign_up_screen.dart';
import 'auth/policy_screen.dart';

import 'navigation/analyse_screen.dart';

import 'navigation/habits_screen.dart';
import 'habits/screens/water_screen.dart';
import 'habits/screens/my_diet_screen.dart';

import 'navigation/content_screen.dart';

import 'navigation/plans_screen.dart';
import 'plans/screens/notifications_screen.dart';

import 'navigation/sleep_screen.dart';
import 'sleep/screens/my_stars_screen.dart';
import 'sleep/sleep_results_screen.dart';
import 'sleep/screens/good_night_screen.dart';
import 'sleep/screens/meditation.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (ctx) => HelzyStars()),
        ChangeNotifierProvider(create: (ctx) => Videos()),
        ChangeNotifierProvider(create: (ctx) => ContentList()),
        ChangeNotifierProvider(create: (ctx) => Sleep()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: basisTheme(),
        home: const MainScreen(),
        initialRoute: '/',
        routes: {
          NavigationBarScreen.routeName: (context) =>
              const NavigationBarScreen(),
          LoginScreen.routeName: (context) => const LoginScreen(),
          SignUpScreen.routeName: (context) => const SignUpScreen(),
          PolicyScreen.routeName: (context) => const PolicyScreen(),
          PlansScreen.routeName: (context) => const PlansScreen(),
          AnalysesScreen.routeName: (context) => const AnalysesScreen(),
          Meditation.routeName: (context) => const Meditation(),
          HabitsScreen.routeName: (context) => const HabitsScreen(),
          SleepScreen.routeName: (context) => const SleepScreen(),
          ContentScreen.routeName: (context) => const ContentScreen(),
          NotificationsScreen.routeName: (context) =>
              const NotificationsScreen(),
          StarScreen.routeName: (context) => const StarScreen(),
          HelzyStarsScreen.routeName: (context) => const HelzyStarsScreen(),
          SleepResultsScreen.routeName: (context) => const SleepResultsScreen(),
          GoodNightScreen.routeName: (context) => const GoodNightScreen(),
          WaterScreen.routeName: (context) => const WaterScreen(),
          MyDietScreen.routeName: (context) => const MyDietScreen(),
          StepsScreen.routeName: (context) => const StepsScreen(),
          Treatment.routeName: (context) => const Treatment(),
          DiaryScreen.routeName: (context) => const DiaryScreen(),
        },
      ),
    );
  }
}
