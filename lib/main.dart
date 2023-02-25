import 'package:flutter/material.dart';
import 'package:helzy/theme.dart';

import './screens/main_screen.dart';
import './screens/login_screen.dart';
import './screens/sign_up_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: basisTheme(),
      home: MainScreen(),
    );
  }
}
