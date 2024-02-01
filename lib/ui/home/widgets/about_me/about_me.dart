import 'package:flutter/material.dart';
import 'package:personal_website/common/responsive/responsive.dart';
import 'package:personal_website/ui/home/widgets/about_me/widgets/about_me_descriptions.dart';
import 'package:personal_website/ui/home/widgets/about_me/widgets/my_avatar.dart';

class AboutMe extends StatelessWidget {
  const AboutMe({super.key});

  @override
  Widget build(BuildContext context) {
    final screen = Screen.of(context);

    final isSmallScreen = screen.type.isMobile || screen.type.isSmallTablet;

    Widget aboutMe = const AboutMeDescriptions();
    Widget space;
    if (isSmallScreen) {
      space = const SizedBox(height: 25);
    } else {
      aboutMe = Expanded(
        child: aboutMe,
      );
      space = const SizedBox(width: 40);
    }

    return Padding(
      padding: screen.contentPadding,
      child: Flex(
        direction: isSmallScreen ? Axis.vertical : Axis.horizontal,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const MyAvatar(),
          space,
          aboutMe,
        ],
      ),
    );
  }
}
