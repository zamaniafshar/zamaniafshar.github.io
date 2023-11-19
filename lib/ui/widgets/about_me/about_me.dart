import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:personal_website/common/constants/assets_paths.dart';
import 'package:personal_website/common/constants/constants.dart';
import 'package:personal_website/common/responsive/responsive.dart';
import 'package:personal_website/ui/widgets/custom_elevated_button.dart';

class AboutMe extends StatelessWidget {
  const AboutMe({super.key});

  @override
  Widget build(BuildContext context) {
    final screen = Screen.of(context);
    final localization = AppLocalizations.of(context)!;
    final theme = Theme.of(context);

    final isSmallScreen = screen.width <= kMinLargeTabletWidth;
    final buttonPadding = EdgeInsets.symmetric(
      horizontal: screen.fromMTD(20, 25, 40),
      vertical: screen.fromMTD(10, 15, 15),
    );

    final myAvatar = ConstrainedBox(
      constraints: const BoxConstraints(
        maxWidth: 300,
        maxHeight: 300,
        minWidth: 150,
        minHeight: 150,
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

    Widget aboutMe = Column(
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
            CustomElevatedButton(
              onPressed: () {},
              padding: buttonPadding,
              gradientBackground: LinearGradient(
                colors: [
                  theme.primaryColorLight,
                  theme.primaryColorDark,
                ],
              ),
              borderRadius: BorderRadius.circular(100),
              child: Text(localization.downloadResume),
            ),
            screen.horizontalSpace(2.5),
            CustomElevatedButton(
              onPressed: () {},
              backgroundColor: Colors.white,
              foregroundColor: theme.primaryColor,
              borderSide: BorderSide(
                color: theme.primaryColor,
              ),
              borderRadius: BorderRadius.circular(100),
              child: Text(localization.hireMe),
            ),
          ],
        ),
      ],
    );

    if (!isSmallScreen) {
      aboutMe = Expanded(child: aboutMe);
    }

    final space = isSmallScreen ? SizedBox(height: 25) : SizedBox(width: 40);

    return Padding(
      padding: screen.contentPadding,
      child: Flex(
        direction: isSmallScreen ? Axis.vertical : Axis.horizontal,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          myAvatar,
          space,
          aboutMe,
        ],
      ),
    );
  }
}
