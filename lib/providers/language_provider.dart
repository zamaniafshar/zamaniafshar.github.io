import 'dart:ui';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:personal_website/common/constants/constants.dart';
import 'package:personal_website/providers/providers.dart';

final languageProvider = NotifierProvider<LanguageNotifier, Locale>(LanguageNotifier.new);

class LanguageNotifier extends Notifier<Locale> {
  @override
  build() {
    final savedLanguageCode = ref.watch(languageDatabaseProvider).getLanguage();
    if (savedLanguageCode != null) {
      return Locale(savedLanguageCode);
    }

    return _getLanguageBasedOnSystem();
  }

  void setLocale(Locale locale) {
    final isSupported = kSupportedLocales.any((e) => e.languageCode == locale.languageCode);
    if (!isSupported) throw ArgumentError('Unsupported locale');
    state = locale;
    ref.read(languageDatabaseProvider).saveLanguage(state.languageCode);
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
