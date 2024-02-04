import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> launchUrlOnWebBrowser(String url) async {
  try {
    final parsedUrl = Uri.parse(url);
    final result = await launchUrl(parsedUrl, mode: LaunchMode.externalApplication);
    if (result) return;
    debugPrint('Failed to open url: $url');
  } catch (e) {
    debugPrint('Something goes wrong when trying to open $url \nerror: $e');
  }
}
