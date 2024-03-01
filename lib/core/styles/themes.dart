import 'package:flutter/material.dart';

import 'app_colors.dart';

Color primaryColor = const Color(0xFF42B488);

ThemeData theme = ThemeData(
  useMaterial3: true,
  primaryColor: primaryColor,
  fontFamily: 'Cabin',
  scaffoldBackgroundColor: Colors.white,
  extensions: const <ThemeExtension<AppColors>>[
    AppColors(
      secondaryColor: Color(0xFFB03538),
    )
  ],
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      padding: EdgeInsets.zero,
      backgroundColor: Colors.transparent,
      alignment: Alignment.centerLeft,
      shadowColor: Colors.transparent,
      surfaceTintColor: Colors.transparent,
      // foregroundColor: Colors.transparent,
      elevation: 0,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.zero,
      ),
      splashFactory: NoSplash.splashFactory,
    ),
  ),
  appBarTheme: const AppBarTheme(
    elevation: 0,
    titleTextStyle: TextStyle(
      color: Colors.black,
      fontSize: 24,
      fontWeight: FontWeight.w700,
    ),
    backgroundColor: Colors.transparent,
    iconTheme: IconThemeData(
      color: Colors.black,
    ),
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    selectedIconTheme: IconThemeData(
      color: Colors.black,
    ),
    selectedLabelStyle: TextStyle(
      color: Colors.black,
    ),
  ),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    elevation: 0,
    backgroundColor: primaryColor,
  ),
  inputDecorationTheme: InputDecorationTheme(
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(
        color: Color(0xFFE0E0E1),
        width: 1,
      ),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(
        color: Color(0xFFE0E0E1),
        width: 1,
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(
        color: Color(0xFFE0E0E1),
        width: 1,
      ),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(
        color: Color(0xFFE0E0E1),
        width: 1,
      ),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(
        color: Color(0xFFE0E0E1),
        width: 1,
      ),
    ),
    disabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(
        color: Color(0xFFE0E0E1),
        width: 1,
      ),
    ),
    hintStyle: const TextStyle(
      color: Color(0xFFA2A1AA),
      fontSize: 15,
    ),
    errorStyle: const TextStyle(
      color: Color(0xFFA2A1AA),
    ),
    floatingLabelBehavior: FloatingLabelBehavior.always,
  ),
  textTheme: const TextTheme(
    headlineLarge: TextStyle(
      fontSize: 25,
      fontWeight: FontWeight.bold,
    ),
    bodyLarge: TextStyle(
      fontSize: 15,
      fontWeight: FontWeight.bold,
    ),
    bodyMedium: TextStyle(
      fontSize: 15,
      fontWeight: FontWeight.normal,
    ),
  ),
);
