import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:personal_website/config/localization/app_localization_data.dart';

import 'localizations.dart';

final appLocalizationProvider =
    NotifierProvider<AppLocalizationNotifier, AppLocalizationData>(AppLocalizationNotifier.new);

class AppLocalizationNotifier extends Notifier<AppLocalizationData> {
  @override
  build() {
    final systemLocale = WidgetsBinding.instance.window.locale;
    final locale = kLocalesList.singleWhere(
      (locale) => systemLocale.languageCode == locale.languageCode,
      orElse: () => kEnglishLocale,
    );
    return _getLocalization(locale);
  }

  void changeLocale(Locale locale) {
    state = _getLocalization(locale);
  }

  AppLocalizationData _getLocalization(Locale locale) {
    if (locale.languageCode == kPersianLocale.languageCode) {
      return persianLocalization;
    }
    return englishLocalization;
  }
}
