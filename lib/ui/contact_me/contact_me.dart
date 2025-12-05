import 'package:flutter/material.dart';
import 'package:personal_website/responsive/responsive.dart';
import 'package:personal_website/config/l10n/app_localizations.dart';
import 'package:personal_website/ui/widgets/animated_title_text.dart';
import 'package:personal_website/ui/contact_me/widgets/contact_information.dart';
import 'package:personal_website/ui/contact_me/widgets/send_message.dart';

class ContactMe extends StatelessWidget {
  const ContactMe({super.key});

  @override
  Widget build(BuildContext context) {
    final screen = Screen.of(context);

    final isSmallScreen = screen.type.isMobile || screen.type.isTablet;

    Widget contactBody;
    if (isSmallScreen) {
      contactBody = const Column(
        children: [
          SendMessage(),
          SizedBox(height: 50),
          ContactInformation(),
        ],
      );
    } else {
      contactBody = ConstrainedBox(
        constraints: const BoxConstraints(
          maxWidth: 1100,
          minHeight: 580,
          maxHeight: 580,
        ),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              flex: 7,
              child: SendMessage(),
            ),
            SizedBox(width: 50),
            Expanded(
              flex: 4,
              child: ContactInformation(),
            ),
          ],
        ),
      );
    }

    return Container(
      padding: screen.contentPadding,
      child: Column(
        children: [
          const ContactMeTitle(),
          const SizedBox(height: 80),
          contactBody,
        ],
      ),
    );
  }
}

class ContactMeTitle extends StatelessWidget {
  const ContactMeTitle({super.key});

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context)!;
    final theme = Theme.of(context);

    return Column(
      children: [
        AnimatedTitleText(
          title: localization.contactTitle,
        ),
        const SizedBox(height: 40),
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 700),
          child: Text(
            localization.contactDescription,
            textAlign: TextAlign.center,
            style: theme.textTheme.titleLarge!.copyWith(
              fontWeight: FontWeight.w300,
            ),
          ),
        ),
      ],
    );
  }
}
