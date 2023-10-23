import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:personal_website/common/responsive/responsive.dart';
import 'package:personal_website/ui/widgets/custom_elevated_button.dart';

class SendEmail extends StatelessWidget {
  const SendEmail({super.key});

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context)!;
    final theme = Theme.of(context);
    final screen = Screen.of(context);
    Widget body;
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
    if (screen.type.isMobile) {
      body = Column(
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
      body = Expanded(
        child: Row(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: textFields,
              ),
            ),
            SizedBox(width: 30),
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
          padding: EdgeInsets.all(30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                localization.contactSendEmailTitle,
                style: theme.textTheme.headlineSmall!.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 15),
              body,
              SizedBox(height: 30),
              SizedBox(
                width: double.infinity,
                child: CustomElevatedButton(
                  onPressed: () {},
                  child: Text(localization.contactMeButton),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.title,
    required this.hint,
    this.maxLines,
    this.expanded = false,
  });

  final String title;
  final String hint;
  final int? maxLines;
  final bool expanded;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    Widget textFiled = TextField(
      cursorColor: theme.primaryColor,
      maxLines: maxLines,
      decoration: InputDecoration(
        hintText: hint,
        border: OutlineInputBorder(),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: theme.primaryColor,
          ),
        ),
      ),
    );
    if (expanded) {
      textFiled = Expanded(child: textFiled);
    }
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: theme.textTheme.titleLarge!.copyWith(
              color: theme.colorScheme.onSurface.withOpacity(0.6),
            ),
          ),
          SizedBox(height: 15),
          textFiled,
        ],
      ),
    );
  }
}
