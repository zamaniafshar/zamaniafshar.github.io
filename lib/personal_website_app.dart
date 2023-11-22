import 'package:flutter/material.dart';
import 'package:personal_website/common/responsive/responsive.dart';
import 'package:personal_website/config/theme/themes.dart';
import 'package:personal_website/ui/home/home.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class PersonalWebsiteApp extends StatelessWidget {
  const PersonalWebsiteApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: getLightTheme,
      home: const HomeScreen(),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      builder: (context, child) {
        return Screen(
          mediaQueryData: MediaQuery.of(context),
          child: child!,
        );
      },
    );
  }
}
