import 'package:flutter/material.dart';
import 'package:helzy/theme.dart';

import './screens/navigation_bar.dart';
import './screens/main_screen.dart';
import './screens/login_screen.dart';
import './screens/sign_up_screen.dart';
import './screens/plans_screen.dart';
import './screens/analyse_screen.dart';

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
        PlansScreen.routeName: (context) => const PlansScreen(),
        AnalysesScreen.routeName: (context) => const AnalysesScreen(),
      },
    );
  }
}
