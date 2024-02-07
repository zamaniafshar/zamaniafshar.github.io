import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:personal_website/config/constants/constants.dart';
import 'package:personal_website/common/responsive/responsive.dart';
import 'package:personal_website/config/theme/themes.dart';
import 'package:personal_website/provider/language_provider.dart';
import 'package:personal_website/ui/home/home.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class PersonalWebsiteApp extends ConsumerWidget {
  const PersonalWebsiteApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentLocale = ref.watch(languageProvider);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: createLightTheme(currentLocale),
      home: const HomeScreen(),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: kSupportedLocales,
      locale: currentLocale,
      builder: (context, child) {
        return Screen(
          mediaQueryData: MediaQuery.of(context),
          child: child!,
        );
      },
    );
  }
}
