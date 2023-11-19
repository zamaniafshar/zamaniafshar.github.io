import 'package:flutter/material.dart';
import 'package:personal_website/common/responsive/responsive.dart';
import 'package:personal_website/ui/widgets/about_me/about_me_descriptions.dart';
import 'package:personal_website/ui/widgets/about_me/my_avatar.dart';

class AboutMe extends StatelessWidget {
  const AboutMe({super.key});

  @override
  Widget build(BuildContext context) {
    final screen = Screen.of(context);

    final isLargeScreen = screen.type.isDesktop;

    Widget aboutMe = const AboutMeDescriptions();
    Widget space;
    if (isLargeScreen) {
      aboutMe = Expanded(
        child: aboutMe,
      );
      space = const SizedBox(width: 40);
    } else {
      space = const SizedBox(height: 25);
    }

    return Padding(
      padding: screen.contentPadding,
      child: Flex(
        direction: isLargeScreen ? Axis.horizontal : Axis.vertical,
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
