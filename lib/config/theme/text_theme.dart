import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

TextTheme get getBlackTextTheme {
  final baseTextTheme = Typography.material2021(
    platform: defaultTargetPlatform,
  ).black;
  final textTheme = const TextTheme(
    headlineSmall: TextStyle(
      color: Colors.black,
    ),
    headlineMedium: TextStyle(
      color: Colors.black,
    ),
    headlineLarge: TextStyle(
      color: Colors.black,
    ),
    displaySmall: TextStyle(
      color: Colors.black,
    ),
    displayMedium: TextStyle(
      color: Colors.black,
    ),
    displayLarge: TextStyle(
      color: Colors.black,
    ),
  );
  return baseTextTheme.merge(textTheme);
}

TextTheme get getWhiteTextTheme {
  final baseTextTheme = Typography.material2021(
    platform: defaultTargetPlatform,
  ).white;
  final textTheme = TextTheme(
    headlineSmall: TextStyle(
      color: Colors.white,
    ),
    headlineMedium: TextStyle(
      color: Colors.white,
    ),
    headlineLarge: TextStyle(
      color: Colors.white,
    ),
    displaySmall: TextStyle(
      color: Colors.white,
    ),
    displayMedium: TextStyle(
      color: Colors.white,
    ),
    displayLarge: TextStyle(
      color: Colors.white,
    ),
  );
  return baseTextTheme.merge(textTheme);
}
