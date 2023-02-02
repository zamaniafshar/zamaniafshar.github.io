import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'personal_website_app.dart';

void main() {
  runApp(
    const ProviderScope(
      child: PersonalWebsiteApp(),
    ),
  );
}
