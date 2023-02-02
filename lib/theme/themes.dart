import 'package:flutter/material.dart';
import 'package:personal_website/theme/app_colors.dart';

ThemeData get getLightTheme {
  return ThemeData(
    fontFamily: 'Vazir',
    primaryColor: AppColors.green,
    colorScheme: const ColorScheme.light(
      background: Colors.white,
      onBackground: Colors.black,
    ),
    textTheme: const TextTheme(
      headlineLarge: TextStyle(
        color: Colors.black,
      ),
      headlineMedium: TextStyle(
        color: Colors.black,
      ),
      headlineSmall: TextStyle(
        color: Colors.black,
      ),
      bodySmall: TextStyle(
        color: Colors.black54,
      ),
      bodyMedium: TextStyle(
        color: Colors.black54,
      ),
      bodyLarge: TextStyle(
        color: Colors.black54,
      ),
      labelSmall: TextStyle(
        color: Colors.black87,
      ),
      labelMedium: TextStyle(
        color: Colors.black87,
      ),
      labelLarge: TextStyle(
        color: Colors.black87,
      ),
      titleSmall: TextStyle(
        color: Colors.black,
      ),
      titleMedium: TextStyle(
        color: Colors.black,
      ),
      titleLarge: TextStyle(
        color: Colors.black,
      ),
    ),
  );
}
