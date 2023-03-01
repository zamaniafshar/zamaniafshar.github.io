import 'package:flutter/material.dart';
import 'package:personal_website/config/localization/app_localization.dart';
import 'package:personal_website/core/responsive/screen.dart';

class AboutMe extends StatelessWidget {
  const AboutMe({super.key});

  @override
  Widget build(BuildContext context) {
    final screen = Screen.of(context);
    final localization = AppLocalization.of(context);
    final theme = Theme.of(context);

    return SizedBox(
      height: screen.h(0.5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(localization.aboutMe),
          FractionallySizedBox(heightFactor: 0.2),
          Text('blalblablablalbla'),
        ],
      ),
    );
  }
}
