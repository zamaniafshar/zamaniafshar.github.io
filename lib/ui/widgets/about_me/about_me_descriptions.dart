import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:personal_website/common/responsive/responsive.dart';
import 'package:personal_website/ui/widgets/custom_elevated_button.dart';

class AboutMeDescriptions extends StatelessWidget {
  const AboutMeDescriptions({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final screen = Screen.of(context);
    final localization = AppLocalizations.of(context)!;
    final theme = Theme.of(context);

    final isLargeScreen = screen.type.isDesktop;
    final buttonPadding = EdgeInsets.symmetric(
      horizontal: screen.fromMTD(20, 25, 40),
      vertical: screen.fromMTD(10, 15, 15),
    );
    final aboutMeTextAlign = isLargeScreen ? TextAlign.start : TextAlign.center;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: isLargeScreen ? CrossAxisAlignment.start : CrossAxisAlignment.center,
      children: [
        Text(
          localization.jobTitle,
          style: theme.textTheme.headlineSmall!.copyWith(
            color: Colors.black38,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          localization.myName,
          style: theme.textTheme.headlineMedium!.copyWith(
            fontWeight: FontWeight.bold,
          ),
          textAlign: aboutMeTextAlign,
        ),
        const SizedBox(height: 10),
        Text(
          localization.aboutDescription,
          style: theme.textTheme.titleMedium,
          textAlign: aboutMeTextAlign,
        ),
        const SizedBox(height: 15),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomElevatedButton(
              onPressed: () {},
              padding: buttonPadding,
              gradientBackground: LinearGradient(
                colors: [
                  theme.primaryColorLight,
                  theme.primaryColorDark,
                ],
              ),
              borderRadius: BorderRadius.circular(100),
              child: Text(localization.downloadResume),
            ),
            const SizedBox(width: 15),
            CustomElevatedButton(
              onPressed: () {},
              backgroundColor: Colors.white,
              foregroundColor: theme.primaryColor,
              borderSide: BorderSide(
                color: theme.primaryColor,
              ),
              borderRadius: BorderRadius.circular(100),
              child: Text(localization.hireMe),
            ),
          ],
        ),
      ],
    );
  }
}
