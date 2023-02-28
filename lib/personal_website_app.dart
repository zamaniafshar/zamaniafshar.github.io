import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:personal_website/config/localization/app_localization.dart';
import 'package:personal_website/config/localization/app_localization_notifier.dart';
import 'package:personal_website/config/localization/localizations.dart';
import 'package:personal_website/core/responsive/screen.dart';
import 'package:personal_website/config/theme/themes.dart';
import 'package:personal_website/ui/screens/home/home.dart';

class PersonalWebsiteApp extends StatelessWidget {
  const PersonalWebsiteApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, _) {
        final localization = ref.watch(appLocalizationProvider);
        return AppLocalization(
          appLocalizationData: localization,
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            locale: localization.locale,
            supportedLocales: kLocalesList,
            theme: getLightTheme,
            home: const HomeScreen(),
            localizationsDelegates: const [
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            builder: (context, child) {
              return Screen(
                mediaQueryData: MediaQuery.of(context),
                child: child!,
              );
            },
          ),
        );
      },
    );
  }
}
