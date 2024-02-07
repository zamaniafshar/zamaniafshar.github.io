import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:personal_website/config/constants/constants.dart';
import 'package:personal_website/provider/language_provider.dart';

class ChangeLanguageMenuButton extends ConsumerWidget {
  const ChangeLanguageMenuButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);

    return DropdownButton<Locale>(
      padding: const EdgeInsets.all(10),
      value: ref.watch(languageProvider),
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
        ref.read(languageProvider.notifier).setLocale(newLocale);
      },
    );
  }
}
