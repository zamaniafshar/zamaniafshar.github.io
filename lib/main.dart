import 'package:flutter/material.dart';
import 'package:personal_website/service_locator.dart';
import 'personal_website_app.dart';

Future<void> main() async {
  await initApp();

  runApp(
    const PersonalWebsiteApp(),
  );
}
