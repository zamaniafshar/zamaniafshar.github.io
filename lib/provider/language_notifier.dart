import 'dart:ui';
import 'package:flutter/material.dart';

import 'package:personal_website/config/constants/constants.dart';
import 'package:personal_website/data/language_database.dart';

class LanguageNotifier extends ValueNotifier<Locale> {
  static LanguageNotifier create(LanguageDatabase database) {
    final savedLanguageCode = database.getLanguage();
    if (savedLanguageCode != null) {
      final value = Locale(savedLanguageCode);
      return LanguageNotifier._(value, database);
    }

    final value = _getLanguageBasedOnSystem();
    return LanguageNotifier._(value, database);
  }

  LanguageNotifier._(
    super.value,
    this._database,
  );

  final LanguageDatabase _database;

  void setLocale(Locale locale) {
    final isSupported = kSupportedLocales.any((e) => e.languageCode == locale.languageCode);
    if (!isSupported) throw ArgumentError('Unsupported locale');
    value = locale;
    _database.saveLanguage(value.languageCode);
  }

  static Locale _getLanguageBasedOnSystem() {
    final systemSupportedLocales = PlatformDispatcher.instance.locales;

    for (Locale locale in systemSupportedLocales) {
      if (locale.languageCode == kPersianLocale.languageCode) {
        return kPersianLocale;
      }
    }
    return kEnglishLocale;
  }
}
