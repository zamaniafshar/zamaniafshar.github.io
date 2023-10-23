import 'package:flutter/material.dart';
import 'package:personal_website/ui/widgets/animated_underline_text.dart';

class AnimatedTitleText extends StatefulWidget {
  const AnimatedTitleText({
    super.key,
    required this.title,
  });

  final String title;

  @override
  State<AnimatedTitleText> createState() => _AnimatedTitleTextState();
}

class _AnimatedTitleTextState extends State<AnimatedTitleText> {
  bool isSelected = false;
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 1), () {
      isSelected = true;
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return AnimatedUnderlineText(
      text: widget.title,
      isSelected: isSelected,
      animateText: false,
      textStyle: theme.textTheme.displaySmall,
      duration: const Duration(milliseconds: 500),
    );
  }
}
