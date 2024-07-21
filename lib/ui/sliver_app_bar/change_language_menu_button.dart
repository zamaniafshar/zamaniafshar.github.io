import 'package:flutter/material.dart';
import 'package:personal_website/config/constants/constants.dart';
import 'package:personal_website/provider/language_notifier.dart';
import 'package:provider/provider.dart';

class ChangeLanguageMenuButton extends StatelessWidget {
  const ChangeLanguageMenuButton({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Consumer<LanguageNotifier>(builder: (context, notifier, _) {
      return DropdownButton<Locale>(
        padding: const EdgeInsets.all(10),
        value: notifier.value,
        icon: const Icon(Icons.language),
        focusColor: Colors.transparent,
        iconEnabledColor: theme.colorScheme.onSurface,
        underline: const SizedBox(),
        items: [
          for (Locale locale in kSupportedLocales)
            DropdownMenuItem(
              value: locale,
              child: Text(
                locale.languageCode,
              ),
            ),
        ],
        selectedItemBuilder: (context) {
          return [
            for (Locale locale in kSupportedLocales)
              DropdownMenuItem(
                child: Padding(
                  padding: const EdgeInsetsDirectional.only(end: 3),
                  child: Text(
                    locale.languageCode,
                    style: TextStyle(
                      color: theme.colorScheme.onSurface,
                    ),
                  ),
                ),
              ),
          ];
        },
        onChanged: (newLocale) {
          if (newLocale == null) return;
          notifier.setLocale(newLocale);
        },
      );
    });
  }
}
