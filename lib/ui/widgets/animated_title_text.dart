import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:personal_website/ui/widgets/animated_underline_text.dart';

class AnimatedTitleText extends HookWidget {
  const AnimatedTitleText({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isSelected = useState(false);

    useEffect(() {
      Future.delayed(const Duration(seconds: 1), () {
        if (!context.mounted) return;
        isSelected.value = true;
      });
      return null;
    }, const []);

    return AnimatedUnderlineText(
      text: title,
      isSelected: isSelected.value,
      selectedTextColor: theme.colorScheme.onSurface,
      textStyle: theme.textTheme.displaySmall,
      duration: const Duration(milliseconds: 500),
    );
  }
}
