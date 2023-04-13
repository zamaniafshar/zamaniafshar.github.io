import 'package:flutter/material.dart';
import 'package:personal_website/config/theme/app_colors.dart';

import 'text_theme.dart';

ThemeData get getLightTheme {
  return ThemeData(
    fontFamily: 'Vazir',
    primaryColorLight: AppColors.greenLight,
    primaryColor: AppColors.green,
    primaryColorDark: AppColors.greenDark,
    colorScheme: const ColorScheme.light(
      background: Colors.white,
      onBackground: Colors.black,
    ),
    textTheme: getLightTextTheme,
  );
}
