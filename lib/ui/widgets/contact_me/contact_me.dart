import 'package:flutter/material.dart';
import 'package:personal_website/common/responsive/responsive.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:personal_website/ui/widgets/animated_title_text.dart';
import 'package:personal_website/ui/widgets/contact_me/widgets/contact_information.dart';
import 'package:personal_website/ui/widgets/contact_me/widgets/send_email.dart';

class ContactMe extends StatelessWidget {
  const ContactMe({super.key});

  @override
  Widget build(BuildContext context) {
    final screen = Screen.of(context);

    Widget contactBody;
    if (screen.type.isDesktop) {
      contactBody = ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: 1100,
          minHeight: screen.type.isDesktop ? 560 : double.infinity,
          maxHeight: screen.type.isDesktop ? 560 : double.infinity,
        ),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              flex: 7,
              child: SendEmail(),
            ),
            SizedBox(width: 50),
            Expanded(
              flex: 4,
              child: ContactInformation(),
            ),
          ],
        ),
      );
    } else {
      contactBody = const Column(
        children: [
          SendEmail(),
          SizedBox(height: 50),
          ContactInformation(),
        ],
      );
    }

    return Container(
      padding: screen.contentPadding.add(
        const EdgeInsets.symmetric(
          vertical: 100,
        ),
      ),
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
