import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:personal_website/provider/providers.dart';
import 'personal_website_app.dart';

Future<void> main() async {
  final container = await initApp();

  runApp(
    ProviderScope(
      parent: container,
      child: const PersonalWebsiteApp(),
    ),
  );
}
