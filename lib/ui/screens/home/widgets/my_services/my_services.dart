import 'package:flutter/material.dart';
import 'package:personal_website/config/theme/text_theme.dart';
import 'package:personal_website/core/constants/assets_paths.dart';
import 'package:personal_website/core/responsive/screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MyServices extends StatelessWidget {
  const MyServices({super.key});

  @override
  Widget build(BuildContext context) {
    final screen = Screen.of(context);
    final localization = AppLocalizations.of(context)!;
    final theme = Theme.of(context);

    return SizedBox(
      height: screen.h(0.6),
      child: Column(
        children: [
          Container(
            width: 200,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Color(0xff7a8aff),
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(15),
              ),
            ),
            child: Text(
              localization.services.toUpperCase(),
              style: theme.textTheme.headlineSmall!.copyWith(
                color: Colors.white,
              ),
            ),
          ),
          Expanded(
            child: Container(
              color: Color(0xff7a8aff),
              child: Column(
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        Expanded(
                          child: Image.asset(kMobileDevelopmentBackgroundPath),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Mobile App Development',
                                style:
                                    theme.textTheme.headlineMedium!.copyWith(color: Colors.white),
                              ),
                              screen.verticalSpace(0.05),
                              Expanded(
                                child: Text('Some description will add here'),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
