import 'package:flutter/material.dart';
import 'package:personal_website/common/constants/constants.dart';
import 'package:personal_website/config/theme/app_colors.dart';

import 'text_theme.dart';

ThemeData createLightTheme(Locale currentLocale) {
  final fontFamily =
      currentLocale == kPersianLocale ? kShabnamFarsiDigitFontFamily : kShabnamFontFamily;
  return ThemeData(
    fontFamily: fontFamily,
    primaryColorLight: AppColors.greenLight,
    primaryColor: AppColors.green,
    primaryColorDark: AppColors.greenDark,
    colorScheme: ColorScheme.light(
      background: Colors.white,
      onBackground: Colors.black,
      secondary: Colors.blue,
      secondaryContainer: Colors.blue.shade700,
    ),
    cardTheme: const CardTheme(
      elevation: 5,
    ),
    textTheme: getBlackTextTheme,
  );
}
