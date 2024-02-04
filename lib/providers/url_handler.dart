import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> launchUrlOnWebBrowser(String url) async {
  try {
    final parsedUrl = Uri.parse(url);
    await launchUrl(parsedUrl, mode: LaunchMode.externalApplication);
  } catch (e) {
    debugPrint('Failed to open url: $url');
  }
}
