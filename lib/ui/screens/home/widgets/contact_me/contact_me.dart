import 'package:flutter/material.dart';
import 'package:personal_website/common/responsive/responsive.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:personal_website/ui/screens/home/widgets/contact_me/widgets/contact_information.dart';
import 'package:personal_website/ui/screens/home/widgets/contact_me/widgets/send_email.dart';

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
          minHeight: screen.type.isDesktop ? 530 : double.infinity,
          maxHeight: screen.type.isDesktop ? 530 : double.infinity,
        ),
        child: Row(
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
      contactBody = Column(
        children: [
          SendEmail(),
          SizedBox(height: 50),
          ContactInformation(),
        ],
      );
    }

    return Container(
      padding: EdgeInsets.symmetric(vertical: 100, horizontal: 30),
      child: Column(
        children: [
          ContactMeTitle(),
          SizedBox(height: 80),
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
        Container(
          padding: const EdgeInsets.only(bottom: 8),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: theme.primaryColor,
              ),
            ),
          ),
          child: Text(
            localization.contactTitle,
            style: theme.textTheme.displaySmall,
          ),
        ),
        SizedBox(height: 40),
        ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 700),
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
