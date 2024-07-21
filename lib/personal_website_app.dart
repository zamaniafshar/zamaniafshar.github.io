import 'package:flutter/material.dart';
import 'package:personal_website/config/constants/constants.dart';
import 'package:personal_website/provider/current_tag_notifier.dart';
import 'package:personal_website/provider/language_notifier.dart';
import 'package:personal_website/provider/message_sender_notifier.dart';
import 'package:personal_website/responsive/responsive.dart';
import 'package:personal_website/config/theme/themes.dart';
import 'package:personal_website/service_locator.dart';
import 'package:personal_website/ui/home.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class PersonalWebsiteApp extends StatelessWidget {
  const PersonalWebsiteApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => LanguageNotifier.create(
            locator(),
          ),
        ),
        ChangeNotifierProvider(
          create: (_) => MessageSenderNotifier(
            locator(),
          ),
        ),
        ChangeNotifierProvider(
          create: (_) => CurrentTagNotifier(),
        ),
      ],
      child: Consumer<LanguageNotifier>(
        builder: (context, notifier, _) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: createLightTheme(notifier.value),
            home: const HomeScreen(),
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: kSupportedLocales,
            locale: notifier.value,
            builder: (context, child) {
              return Screen(
                mediaQueryData: MediaQuery.of(context),
                child: child!,
              );
            },
          );
        },
      ),
    );
  }
}
