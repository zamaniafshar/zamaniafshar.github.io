import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:personal_website/common/responsive/screen.dart';

class MySkills extends StatelessWidget {
  const MySkills({super.key});

  @override
  Widget build(BuildContext context) {
    final screen = Screen.of(context);
    final localization = AppLocalizations.of(context)!;
    final softwareSkills = SkillsSection(
      title: localization.softwareSkills,
      children: const [
        SkillLabel(label: 'TDD'),
        SkillLabel(label: 'SOLID'),
        SkillLabel(label: 'OOD'),
        SkillLabel(label: 'Clean Architecture'),
        SkillLabel(label: 'MVC'),
        SkillLabel(label: 'Java'),
        SkillLabel(label: 'Git'),
        SkillLabel(label: 'GitHub'),
        SkillLabel(label: 'DesignPatterns'),
      ],
    );
    final flutterSkills = SkillsSection(
      title: localization.flutterSkills,
      children: const [
        SkillLabel(label: 'FLutter'),
        SkillLabel(label: 'Dart'),
        SkillLabel(label: 'Bloc'),
        SkillLabel(label: 'Riverpod'),
        SkillLabel(label: 'Getx'),
        SkillLabel(label: 'Animations'),
        SkillLabel(label: 'Adaptive UI'),
        SkillLabel(label: 'Responsive UI'),
        SkillLabel(label: 'Http & Dio'),
      ],
    );
    final softSkills = SkillsSection(
      title: localization.softSkills,
      children: const [
        SkillLabel(label: 'Time Management'),
        SkillLabel(label: 'Problem Solving'),
        SkillLabel(label: 'Adaptability'),
      ],
    );

    final Widget skills;
    if (screen.type.isDesktop) {
      skills = Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(child: softwareSkills),
          Expanded(child: flutterSkills),
          Expanded(child: softSkills),
        ],
      );
    } else if (screen.type.isTablet) {
      skills = Column(
        children: [
          Row(
            children: [
              Expanded(child: softwareSkills),
              Expanded(child: flutterSkills),
            ],
          ),
          Row(
            children: [
              Expanded(child: softSkills),
              const Spacer(),
            ],
          ),
        ],
      );
    } else {
      skills = Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          softwareSkills,
          flutterSkills,
          softSkills,
        ],
      );
    }

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: screen.fromMTD(30, screen.w(0.05), screen.w(0.09)),
      ),
      child: skills,
    );
  }
}

class SkillsSection extends StatelessWidget {
  const SkillsSection({
    Key? key,
    required this.title,
    required this.children,
  }) : super(key: key);

  final String title;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.only(bottom: 8),
            margin: const EdgeInsets.only(left: 10),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: theme.colorScheme.secondary,
                ),
              ),
            ),
            child: Text(
              title,
              style: theme.textTheme.titleLarge,
            ),
          ),
          const SizedBox(height: 20),
          Wrap(
            alignment: WrapAlignment.start,
            children: children,
          ),
        ],
      ),
    );
  }
}

class SkillLabel extends StatelessWidget {
  const SkillLabel({
    Key? key,
    required this.label,
  }) : super(key: key);

  final String label;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      constraints: const BoxConstraints(minWidth: 80),
      decoration: BoxDecoration(
        border: Border.all(
          color: theme.colorScheme.secondary,
        ),
        color: Colors.lightBlue.shade50,
        borderRadius: BorderRadius.circular(100),
      ),
      child: Text(
        label,
        textAlign: TextAlign.center,
        style: theme.textTheme.labelLarge!.copyWith(
          color: theme.colorScheme.secondaryContainer,
        ),
      ),
    );
  }
}
