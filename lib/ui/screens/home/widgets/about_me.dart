import 'package:flutter/material.dart';
import 'package:personal_website/core/responsive/screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:personal_website/ui/widgets/underline_text.dart';

class AboutMe extends StatelessWidget {
  const AboutMe({super.key});

  @override
  Widget build(BuildContext context) {
    final screen = Screen.of(context);
    final localization = AppLocalizations.of(context)!;
    final theme = Theme.of(context);

    return SizedBox(
      height: screen.h(0.7),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: screen.fromMTD(30, screen.w(0.1), screen.w(0.25)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedUnderlineText(
              label: localization.aboutMe.toUpperCase(),
              selectedColor: theme.primaryColor,
              textStyle: theme.textTheme.headlineSmall!.copyWith(
                fontWeight: FontWeight.bold,
                wordSpacing: 2,
                letterSpacing: 2,
              ),
              isSelected: true,
            ),
            screen.verticalSpace(0.05),
            Text(
              localization.aboutDescription,
              style: theme.textTheme.titleMedium,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
