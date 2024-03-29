import 'package:flutter/material.dart';

const largeTextSize = 26;
const mediumTextSize = 20;
const smallTextSize = 16;

const String fontNameDefault = 'Istok';
const String fontNameTitle = '';

ThemeData basisTheme() => ThemeData(
      brightness: Brightness.light,
      primaryColor: Colors.pink,
      scaffoldBackgroundColor: const Color.fromRGBO(77, 184, 158, 1),
      fontFamily: fontNameDefault,
      textTheme: const TextTheme(
        bodySmall: TextStyle(color: Colors.white),
        bodyMedium: TextStyle(color: Colors.white, fontSize: 16),
        bodyLarge: TextStyle(
          color: Colors.white,
          fontSize: 20,
        ),
        headlineSmall: TextStyle(
            color: Colors.white,
            fontFamily: fontNameDefault,
            fontWeight: FontWeight.w700),
        headlineMedium: TextStyle(
            color: Colors.white,
            fontFamily: fontNameDefault,
            fontWeight: FontWeight.w700),
        headlineLarge: TextStyle(
            color: Colors.white,
            fontFamily: fontNameDefault,
            fontWeight: FontWeight.w700),
        displayLarge: TextStyle(
            color: Colors.white,
            fontFamily: fontNameDefault,
            fontWeight: FontWeight.w700),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.pink,
          foregroundColor: Colors.white,
          fixedSize: const Size(200, 50),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          textStyle: const TextStyle(fontFamily: fontNameDefault, fontSize: 18),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: Colors.white,
          textStyle: const TextStyle(
            fontFamily: fontNameDefault,
            fontSize: 15,
            decoration: TextDecoration.underline,
          ),
        ),
      ),
    );
