import 'package:flutter/material.dart';

const largeTextSize = 26;
const mediumTextSize = 20;
const smallTextSize = 16;

const String fontNameDefault = 'Roboto';
const String fontNameTitle = '';

ThemeData basisTheme() => ThemeData(
      brightness: Brightness.light,
      primaryColor: Colors.pink.shade400,
      scaffoldBackgroundColor: Colors.blue.shade400,
      fontFamily: fontNameDefault,
      textTheme: const TextTheme(
        bodyMedium: TextStyle(color: Colors.white, fontSize: 16),
        headlineSmall:
            TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
        headlineLarge:
            TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.pink,
          foregroundColor: Colors.white,
          fixedSize: const Size(250, 50),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          textStyle: const TextStyle(fontSize: 18),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: Colors.white,
          textStyle: const TextStyle(
              fontSize: 15, decoration: TextDecoration.underline),
        ),
      ),
    );
