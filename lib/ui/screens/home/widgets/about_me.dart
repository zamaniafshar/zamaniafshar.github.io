import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:personal_website/common/constants/constants.dart';
import 'package:personal_website/common/responsive/responsive.dart';

class AboutMe extends StatelessWidget {
  const AboutMe({super.key});

  @override
  Widget build(BuildContext context) {
    final screen = Screen.of(context);
    final localization = AppLocalizations.of(context)!;
    final theme = Theme.of(context);
    final isSmallScreen = screen.width <= kMinLargeTabletWidth;
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
          height: screen.w(30),
          width: screen.w(30),
          child: const CircleAvatar(
            foregroundImage: AssetImage(kMyPictureImagePath),
          ),
        ),
      ),
    );
    final aboutMeTextAlign = isSmallScreen ? TextAlign.center : TextAlign.start;
    final aboutMe = Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: isSmallScreen ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      children: [
        Text(
          localization.jobTitle,
          style: theme.textTheme.headlineSmall!.copyWith(
            color: Colors.black38,
          ),
        ),
        screen.verticalSpace(2),
        Text(
          localization.myName,
          style: theme.textTheme.headlineMedium!.copyWith(
            fontWeight: FontWeight.bold,
          ),
          textAlign: aboutMeTextAlign,
        ),
        screen.verticalSpace(2),
        Text(
          localization.aboutDescription,
          style: theme.textTheme.titleMedium,
          textAlign: aboutMeTextAlign,
        ),
        screen.verticalSpace(2.5),
        Row(
          mainAxisSize: MainAxisSize.min,
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
            screen.horizontalSpace(2.5),
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
    if (isSmallScreen) {
      child = Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          myAvatar,
          screen.verticalSpace(5),
          aboutMe,
        ],
      );
    } else {
      child = Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          myAvatar,
          screen.horizontalSpace(5),
          Expanded(child: aboutMe),
        ],
      );
    }

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: screen.adaptive(defaultValue: screen.w(5), desktop: screen.w(10))!,
      ),
      child: child,
    );
  }
}
