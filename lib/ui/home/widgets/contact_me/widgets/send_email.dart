import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:personal_website/common/responsive/responsive.dart';
import 'package:personal_website/ui/home/widgets/contact_me/widgets/custom_text_field.dart';
import 'package:personal_website/ui/widgets/custom_elevated_button.dart';

class SendEmail extends StatelessWidget {
  const SendEmail({super.key});

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context)!;
    final theme = Theme.of(context);
    final screen = Screen.of(context);

    Widget child;
    final textFields = [
      CustomTextField(
        title: localization.contactName,
        hint: localization.contactNameHint,
      ),
      CustomTextField(
        title: localization.contactEmail,
        hint: localization.contactEmailHint,
      ),
      CustomTextField(
        title: localization.contactSubject,
        hint: localization.contactSubject,
      ),
    ];

    final isSmallScreen = screen.type.isMobile;

    if (isSmallScreen) {
      child = Column(
        children: [
          ...textFields,
          CustomTextField(
            title: localization.contactComment,
            hint: localization.contactCommentHint,
            maxLines: 10,
          ),
        ],
      );
    } else {
      child = Expanded(
        child: Row(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: textFields,
              ),
            ),
            const SizedBox(width: 30),
            Expanded(
              child: CustomTextField(
                title: localization.contactComment,
                hint: localization.contactCommentHint,
                maxLines: 50,
                expanded: true,
              ),
            ),
          ],
        ),
      );
    }
    return ConstrainedBox(
      constraints: BoxConstraints.tightFor(
        height: screen.type.isMobile ? null : 560,
        width: double.infinity,
      ),
      child: Card(
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                localization.contactSendEmailTitle,
                style: theme.textTheme.headlineSmall!.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 15),
              child,
              const SizedBox(height: 30),
              CustomElevatedButton(
                width: double.infinity,
                gradientBackground: LinearGradient(
                  colors: [
                    theme.primaryColorLight,
                    theme.primaryColorDark,
                  ],
                ),
                onPressed: () {},
                child: Text(localization.contactMeButton),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
