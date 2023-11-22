import 'package:flutter/material.dart';
import 'package:personal_website/common/responsive/responsive.dart';
import 'package:personal_website/ui/home/widgets/my_skills/widgets/language_skills.dart';
import 'package:personal_website/ui/home/widgets/my_skills/widgets/skills.dart';

class MySkills extends StatelessWidget {
  const MySkills({super.key});

  @override
  Widget build(BuildContext context) {
    final screen = Screen.of(context);

    Widget skills = const Skills();
    Widget languageSkills = const LanguageSkills();

    final isLargeScreen = screen.type.isDesktop;
    if (isLargeScreen) {
      skills = Expanded(child: skills);
      languageSkills = Expanded(child: languageSkills);
    }

    return Padding(
      padding: screen.contentPadding,
      child: Flex(
        direction: isLargeScreen ? Axis.horizontal : Axis.vertical,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          skills,
          const SizedBox(
            width: 30,
            height: 60,
          ),
          languageSkills,
        ],
      ),
    );
  }
}
