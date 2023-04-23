import 'package:flutter/material.dart';

extension TextStyleExtensions on TextStyle {
  Size calculateTextSize(BuildContext context, String label) {
    final textPainter = TextPainter(
      text: TextSpan(text: label, style: this),
      maxLines: 1,
      locale: Localizations.localeOf(context),
      textScaleFactor: MediaQuery.of(context).textScaleFactor,
      textDirection: Directionality.of(context),
    )..layout();
    return textPainter.size;
  }
}
