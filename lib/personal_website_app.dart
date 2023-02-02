import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:personal_website/localization/app_localization.dart';
import 'package:personal_website/localization/app_localization_notifier.dart';
import 'package:personal_website/localization/localizations.dart';
import 'package:personal_website/ui/screens/home/home.dart';

class PersonalWebsiteApp extends StatelessWidget {
  const PersonalWebsiteApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(1600, 800),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, _) {
        return Consumer(
          builder: (context, ref, _) {
            final localization = ref.watch(appLocalizationProvider);
            return AppLocalization(
              appLocalizationData: localization,
              child: MaterialApp(
                debugShowCheckedModeBanner: false,
                locale: localization.locale,
                supportedLocales: kLocalesList,
                localizationsDelegates: const [
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],
                home: const HomeScreen(),
                builder: (context, child) {
                  return MediaQuery(
                    data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
                    child: child!,
                  );
                },
              ),
            );
          },
        );
      },
    );
  }
}
