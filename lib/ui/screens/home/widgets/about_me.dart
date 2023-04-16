import 'package:flutter/material.dart';
import 'package:personal_website/config/theme/text_theme.dart';
import 'package:personal_website/core/constants/assets_paths.dart';
import 'package:personal_website/core/responsive/constants.dart';
import 'package:personal_website/core/responsive/screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AboutMe extends StatelessWidget {
  const AboutMe({super.key});

  @override
  Widget build(BuildContext context) {
    final screen = Screen.of(context);
    final localization = AppLocalizations.of(context)!;
    final theme = Theme.of(context);
    final myAvatar = ConstrainedBox(
      constraints: const BoxConstraints(
        maxWidth: 300,
        maxHeight: 300,
        minWidth: 120,
        minHeight: 120,
      ),
      child: PhysicalModel(
        shape: BoxShape.circle,
        color: Colors.white,
        elevation: 10,
        child: Container(
          padding: const EdgeInsets.all(8),
          height: screen.w(0.3),
          width: screen.w(0.3),
          child: const CircleAvatar(
            foregroundImage: AssetImage(kMyPictureImagePath),
          ),
        ),
      ),
    );

    final aboutMe = Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          localization.aboutMe.toUpperCase(),
          style: theme.textTheme.headlineMedium!.copyWith(
            color: Colors.black38,
            fontWeight: FontWeight.w900,
          ),
        ),
        const SizedBox(height: 5),
        Text(
          localization.aboutMeTitle,
          style: theme.textTheme.headlineMedium!.copyWith(
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.start,
        ),
        const SizedBox(height: 10),
        Text(
          localization.aboutDescription,
          style: theme.textTheme.titleMedium,
          textAlign: TextAlign.start,
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: theme.primaryColor,
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100),
                ),
                padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
              ),
              child: Text(
                localization.downloadResume,
                style: theme.textTheme.titleMedium!.copyWith(
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(width: 20),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: theme.primaryColor,
                surfaceTintColor: theme.primaryColor,
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100),
                  side: BorderSide(
                    color: theme.primaryColor,
                  ),
                ),
                padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
              ),
              child: Text(
                localization.hireMe,
                style: theme.textTheme.titleMedium!.copyWith(
                  color: theme.primaryColor,
                ),
              ),
            ),
          ],
        ),
      ],
    );

    final Widget child;
    if (screen.width < kMinLargeTabletWidth) {
      child = Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          myAvatar,
          const SizedBox(height: 20),
          aboutMe,
        ],
      );
    } else {
      child = Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          myAvatar,
          const SizedBox(width: 20),
          Expanded(child: aboutMe),
        ],
      );
    }

    return SizedBox(
      height: screen.h(1),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: screen.fromMTD(30, screen.w(0.1), screen.w(0.15)),
        ),
        child: child,
      ),
    );
  }
}
