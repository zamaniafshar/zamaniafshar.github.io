import 'package:flutter/material.dart';
import 'package:personal_website/common/constants/constants.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ContactInformation extends StatelessWidget {
  const ContactInformation({super.key});

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context)!;
    final theme = Theme.of(context);

    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(30),
        child: ListTileTheme(
          data: ListTileThemeData(
            contentPadding: const EdgeInsets.symmetric(vertical: 0),
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
              const SizedBox(height: 30),
              Text(
                localization.contactInfoDescription,
                style: theme.textTheme.titleMedium!.copyWith(
                  color: Colors.black87,
                  letterSpacing: 1,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 30),
              ListTile(
                leading: const Icon(Icons.location_on),
                title: Text(localization.contactAddress),
              ),
              const ListTile(
                leading: Icon(Icons.email_rounded),
                title: Text(kEmailAddress),
              ),
              const ListTile(
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
