import 'package:flutter/material.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({
    Key? key,
    required this.title,
    required this.description,
    required this.child,
  }) : super(key: key);

  final String title;
  final String description;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.only(bottom: 5),
          margin: const EdgeInsetsDirectional.only(start: 10),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: theme.colorScheme.secondary,
              ),
            ),
          ),
          child: Text(
            title,
            style: theme.textTheme.headlineSmall!.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(height: 15),
        Padding(
          padding: const EdgeInsetsDirectional.only(start: 10),
          child: Text(
            description,
            style: theme.textTheme.titleMedium,
          ),
        ),
        const SizedBox(height: 20),
        child,
      ],
    );
  }
}
