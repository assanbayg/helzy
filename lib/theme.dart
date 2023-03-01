import 'package:flutter/material.dart';

const largeTextSize = 26;
const mediumTextSize = 20;
const smallTextSize = 16;

const String fontNameDefault = 'Roboto';
const String fontNameTitle = '';

ThemeData basisTheme() => ThemeData(
      brightness: Brightness.light,
      primaryColor: Colors.teal,
      scaffoldBackgroundColor: Colors.lightGreen.shade50,
      fontFamily: fontNameDefault,
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
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: Colors.teal,
          textStyle: const TextStyle(
              fontSize: 15, decoration: TextDecoration.underline),
        ),
      ),
    );
