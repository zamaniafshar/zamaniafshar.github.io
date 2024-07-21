import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:personal_website/data/language_database.dart';
import 'package:personal_website/data/message_sender_api.dart';

final locator = GetIt.instance;

Future<void> initApp() async {
  if (kReleaseMode) {
    debugPrint = (String? message, {int? wrapWidth}) {};
  }

  await Hive.initFlutter();
  final languageDatabase = LanguageDatabase();
  await languageDatabase.init();

  locator.registerSingleton(languageDatabase);

  locator.registerSingleton(MessageSenderApi());
}
