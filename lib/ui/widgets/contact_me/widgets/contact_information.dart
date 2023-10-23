import 'package:flutter/material.dart';
import 'package:personal_website/common/constants/constants.dart';
import 'package:personal_website/common/responsive/responsive.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ContactInformation extends StatelessWidget {
  const ContactInformation({super.key});

  @override
  Widget build(BuildContext context) {
    final screen = Screen.of(context);
    final localization = AppLocalizations.of(context)!;
    final theme = Theme.of(context);
    return Card(
      elevation: 5,
      child: Padding(
        padding: EdgeInsets.all(30),
        child: ListTileTheme(
          data: ListTileThemeData(
            contentPadding: EdgeInsets.symmetric(vertical: 0),
            titleTextStyle: theme.textTheme.titleLarge,
            iconColor: theme.primaryColor,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                localization.contactInfoTitle,
                style: theme.textTheme.headlineMedium,
              ),
              SizedBox(height: 30),
              Text(
                localization.contactInfoDescription,
                style: theme.textTheme.titleMedium!.copyWith(
                  color: Colors.black87,
                  letterSpacing: 1,
                  height: 1.5,
                ),
              ),
              SizedBox(height: 30),
              ListTile(
                leading: Icon(Icons.location_on),
                title: Text(localization.contactAddress),
              ),
              ListTile(
                leading: Icon(Icons.email_rounded),
                title: Text(kEmailAddress),
              ),
              ListTile(
                leading: Icon(Icons.phone),
                title: Text(kPhoneNumber),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
