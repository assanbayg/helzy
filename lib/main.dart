import 'package:flutter/material.dart';
import 'package:helzy/main_screens/auth/main_screen.dart';
import 'package:helzy/providers/auth_provider.dart';
import 'package:helzy/services/auth_service.dart';
import 'package:provider/provider.dart';
//firebase related imports
import 'package:firebase_core/firebase_core.dart';
import 'config/firebase_options.dart';
// localization related imports
import 'package:flutter_localizations/flutter_localizations.dart';
import 'langs/app_localizations.dart';
//auth related imports
import 'main_screens/auth/login_screen.dart';
import 'main_screens/auth/policy_screen.dart';
import 'main_screens/auth/sign_up_screen.dart';
// habits screen related imports
import 'main_screens/habits/screens/diary_screen.dart';
import 'main_screens/habits/screens/my_diet_screen.dart';
import 'main_screens/habits/screens/steps_screen.dart';
import 'main_screens/habits/screens/water_screen.dart';
// navigation bar related imports
import 'main_screens/navigation/analyse_screen.dart';
import 'main_screens/navigation/articles_screen.dart';
import 'main_screens/navigation/habits_screen.dart';
import 'main_screens/navigation/plans_screen.dart';
import 'main_screens/navigation/sleep_screen.dart';
import 'main_widgets/navigation_bar.dart';
// plans related imports
import 'main_screens/plans/screens/notifications_screen.dart';
import 'main_screens/plans/screens/treatment_screen.dart';
//sleep screen related imports
import 'main_screens/sleep/screens/good_night_screen.dart';
import 'main_screens/sleep/screens/meditation.dart';
import 'main_screens/sleep/screens/my_stars_screen.dart';
import 'main_screens/sleep/sleep_results_screen.dart';
// other imports
import 'providers/articles_provider.dart';
import 'providers/helzy_star_provider.dart';
import 'providers/video_provider.dart';
import 'main_screens/star_screen.dart';
import 'themes/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    AuthProvider(
      auth: AuthService(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (ctx) => HelzyStarsProvider()),
        ChangeNotifierProvider(create: (ctx) => Videos()),
        ChangeNotifierProvider(create: (ctx) => ArticlesProvider()),
        ChangeNotifierProvider(create: (ctx) => Sleep()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Helzy',
        theme: basisTheme(),
        localizationsDelegates: const [
          AppLocalizationsDelegate(),
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('en', 'UK'),
          Locale('ru', 'RU'),
          Locale('kk', 'KK'),
        ],
        // home: const MainScreen(),
        home: const NavigationBarScreen(),
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
          ArticlesScreen.routeName: (context) => const ArticlesScreen(),
          NotificationsScreen.routeName: (context) =>
              const NotificationsScreen(),
          StarScreen.routeName: (context) => const StarScreen(),
          HelzyStarsScreen.routeName: (context) => const HelzyStarsScreen(),
          SleepResultsScreen.routeName: (context) => const SleepResultsScreen(),
          GoodNightScreen.routeName: (context) => const GoodNightScreen(),
          WaterScreen.routeName: (context) => const WaterScreen(),
          MyDietScreen.routeName: (context) => const MyDietScreen(),
          StepsScreen.routeName: (context) => const StepsScreen(),
          TreatmentScreen.routeName: (context) => const TreatmentScreen(),
          DiaryScreen.routeName: (context) => const DiaryScreen(),
        },
      ),
    );
  }
}
