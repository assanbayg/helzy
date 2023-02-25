import 'package:flutter/material.dart';

const LargeTextSize = 26;
const MediumTextSize = 20;
const SmallTextSize = 16;

const String FontNameDefault = '';
const String FontNameTitle = '';

ThemeData basisTheme() => ThemeData(
      brightness: Brightness.light,
      primaryColor: Colors.teal,
      scaffoldBackgroundColor: Colors.lightGreen.shade50,
      fontFamily: 'Roboto',
      textTheme: const TextTheme(
        bodyMedium: TextStyle(color: Colors.teal, fontSize: 16),
        headlineSmall:
            TextStyle(color: Colors.teal, fontWeight: FontWeight.w700),
        headlineLarge:
            TextStyle(color: Colors.teal, fontWeight: FontWeight.w700),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.teal.shade500,
          foregroundColor: Colors.white,
          fixedSize: const Size(250, 50),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          textStyle: const TextStyle(fontSize: 18),
        ),
      ),
    );
