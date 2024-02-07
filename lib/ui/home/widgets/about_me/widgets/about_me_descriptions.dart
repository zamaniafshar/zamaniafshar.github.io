import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:personal_website/config/constants/constants.dart';
import 'package:personal_website/common/responsive/responsive.dart';
import 'package:personal_website/providers/indexed_list_provider.dart';
import 'package:personal_website/providers/url_handler.dart';
import 'package:personal_website/ui/widgets/custom_elevated_button.dart';

class AboutMeDescriptions extends ConsumerWidget {
  const AboutMeDescriptions({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final screen = Screen.of(context);
    final localization = AppLocalizations.of(context)!;
    final theme = Theme.of(context);

    final isSmallScreen = screen.type.isMobile;
    final buttonPadding = EdgeInsets.symmetric(
      horizontal: screen.fromMTD(20, 25, 40),
      vertical: screen.fromMTD(10, 15, 15),
    );
    final aboutMeTextAlign = isSmallScreen ? TextAlign.center : TextAlign.start;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: isSmallScreen ? CrossAxisAlignment.center : CrossAxisAlignment.start,
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
              onPressed: () => launchUrlOnWebBrowser(kMyResumeDownloadUrl),
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
              // scroll to contact me
              onPressed: () => ref.read(indexedListNotifierProvider.notifier).animateToLast(),
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
