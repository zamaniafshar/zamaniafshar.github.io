import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:personal_website/data/language_database.dart';

Future<ProviderContainer> initApp() async {
  if (kReleaseMode) {
    debugPrint = (String? message, {int? wrapWidth}) {};
  }

  await Hive.initFlutter();
  final languageDatabase = LanguageDatabase();
  await languageDatabase.init();

  return ProviderContainer(
    overrides: [
      languageDatabaseProvider.overrideWithValue(languageDatabase),
    ],
  );
}

final languageDatabaseProvider = Provider<LanguageDatabase>(
  (ref) => throw UnimplementedError(),
);
