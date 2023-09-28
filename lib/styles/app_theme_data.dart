import 'package:flutter/material.dart';

class AppThemeData {
  static ThemeData lightThemeData = ThemeData(
    // Define the primary color for the app
    primaryColor: Colors.blue,
    // fontFamily: FontFamily.inter,

    // Define the secondary color, which is used for floating action buttons, sliders, etc.
    colorScheme: ColorScheme.fromSwatch().copyWith(
      secondary: Colors.green,
    ),

    brightness: Brightness.light,

    // Define the default text theme
    textTheme: const TextTheme(
      // Define the default text style
      bodyLarge: TextStyle(fontSize: 16.0, color: Colors.black),
      bodyMedium: TextStyle(fontSize: 14.0, color: Colors.grey),
      displayLarge: TextStyle(fontSize: 32.0, fontWeight: FontWeight.bold),
    ),

    // Define the app bar theme
    appBarTheme: const AppBarTheme(
      // Customize the appearance of the app bar
      color: Colors.blue,
    ),
  );

  static ThemeData darkThemeData = ThemeData(
    // Define the primary color for the app
    primaryColor: Colors.blue,
    // fontFamily: FontFamily.inter,

    // Define the secondary color, which is used for floating action buttons, sliders, etc.
    colorScheme: ColorScheme.fromSwatch().copyWith(
      secondary: Colors.green,
    ),

    // brightness: Brightness.dark,

    // Define the default text theme
    textTheme: const TextTheme(
      // Define the default text style
      bodyLarge: TextStyle(fontSize: 16.0, color: Colors.black),
      bodyMedium: TextStyle(fontSize: 14.0, color: Colors.grey),
      displayLarge: TextStyle(fontSize: 32.0, fontWeight: FontWeight.bold),
    ),

    // Define the app bar theme
    appBarTheme: const AppBarTheme(
      // Customize the appearance of the app bar
      color: Colors.blue,
    ),
  );
}
