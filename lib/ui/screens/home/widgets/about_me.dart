import 'package:flutter/material.dart';
import 'package:personal_website/config/theme/text_theme.dart';
import 'package:personal_website/core/constants/assets_paths.dart';
import 'package:personal_website/core/responsive/screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AboutMe extends StatelessWidget {
  const AboutMe({super.key});

  @override
  Widget build(BuildContext context) {
    final screen = Screen.of(context);
    final localization = AppLocalizations.of(context)!;
    final theme = Theme.of(context);

    return SizedBox(
      height: screen.h(0.5),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: screen.fromMTD(30, screen.w(0.1), screen.w(0.25)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ConstrainedBox(
              constraints: const BoxConstraints(
                maxWidth: 250,
                maxHeight: 250,
                minWidth: 120,
                minHeight: 120,
              ),
              child: CircleAvatar(
                radius: screen.w(0.5) / 2,
                backgroundColor: Colors.white12,
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  height: double.infinity,
                  width: double.infinity,
                  child: const CircleAvatar(
                    foregroundImage: AssetImage(kMyPictureImagePath),
                  ),
                ),
              ),
            ),
            Text(
              localization.aboutMe.toUpperCase(),
              style: theme.textTheme.headlineSmall!.merge(kMediumTitleTextStyle),
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
