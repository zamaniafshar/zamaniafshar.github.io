import 'package:flutter/material.dart';
import 'package:personal_website/data/models/app_localization_data.dart';

class AppLocalization extends InheritedWidget {
  const AppLocalization({
    super.key,
    required this.appLocalizationData,
    required super.child,
  });

  final AppLocalizationData appLocalizationData;

  @override
  bool updateShouldNotify(covariant AppLocalization oldWidget) {
    final locale = appLocalizationData.locale;
    final oldLocale = oldWidget.appLocalizationData.locale;
    return oldLocale.languageCode != locale.languageCode ||
        oldLocale.countryCode != locale.countryCode;
  }

  static AppLocalizationData of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<AppLocalization>()!.appLocalizationData;
  }
}
