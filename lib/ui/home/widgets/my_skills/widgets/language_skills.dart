import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:personal_website/common/constants/assets_paths.dart';
import 'package:personal_website/ui/home/widgets/my_skills/widgets/skills_section.dart';

class LanguageSkills extends StatelessWidget {
  const LanguageSkills({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context)!;

    return SkillsSection(
      title: localization.languageSkills,
      description: localization.languageSkillsDescription,
      child: Row(
        children: [
          Expanded(
            child: LanguageSkill(
              name: localization.languageNamePersian,
              icon: SvgPicture.asset(
                kPersianFlagRoundedSvgPath,
              ),
            ),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: LanguageSkill(
              name: localization.languageNameEnglish,
              icon: SvgPicture.asset(
                kEnglishFlagRoundedSvgPath,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class LanguageSkill extends StatelessWidget {
  const LanguageSkill({
    super.key,
    required this.name,
    required this.icon,
  });

  final String name;
  final Widget icon;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return PhysicalModel(
      color: theme.colorScheme.surface,
      borderRadius: BorderRadius.circular(100),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Row(
          children: [
            SizedBox.square(
              dimension: 40,
              child: icon,
            ),
            const SizedBox(
              width: 20,
            ),
            Text(
              name,
              style: theme.textTheme.titleMedium!.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
