import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:personal_website/ui/widgets/my_skills/widgets/skills_section.dart';

class Skills extends StatelessWidget {
  const Skills({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context)!;

    return SkillsSection(
      title: localization.skills,
      description: localization.skillsDescription,
      child: const Wrap(
        alignment: WrapAlignment.start,
        children: [
          SkillLabel(label: 'Dart'),
          SkillLabel(label: 'Java'),
          SkillLabel(label: 'Flutter'),
          SkillLabel(label: 'State Management'),
          SkillLabel(label: 'Clean Architecture'),
          SkillLabel(label: 'SOLID'),
          SkillLabel(label: 'DesignPatterns'),
          SkillLabel(label: 'RESTful APIs'),
          SkillLabel(label: 'Git'),
          SkillLabel(label: 'Animations'),
          SkillLabel(label: 'UI/UX Design'),
          SkillLabel(label: 'Responsive UI'),
          SkillLabel(label: 'Time Management'),
          SkillLabel(label: 'Problem Solving'),
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
        style: theme.textTheme.titleMedium!.copyWith(
          color: theme.colorScheme.secondaryContainer,
        ),
      ),
    );
  }
}
