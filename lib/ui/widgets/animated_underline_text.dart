import 'package:flutter/material.dart';

class AnimatedUnderlineText extends StatelessWidget {
  const AnimatedUnderlineText({
    Key? key,
    required this.text,
    this.textStyle,
    this.selectedTextColor,
    this.unselectedTextColor,
    this.isSelected = false,
    this.duration = const Duration(seconds: 1),
    this.underlineMaxHeight = 4,
  }) : super(key: key);

  final String text;
  final bool isSelected;
  final Duration duration;
  final TextStyle? textStyle;
  final Color? selectedTextColor;
  final Color? unselectedTextColor;
  final double underlineMaxHeight;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textStyle = this.textStyle ?? theme.textTheme.titleMedium!;
    final textSize = textStyle.calculateTextSize(context, text);
    final selectedTextColor = this.selectedTextColor ?? theme.primaryColor;
    final unselectedTextColor = this.unselectedTextColor ?? theme.colorScheme.onSurface;

    return SizedBox(
      height: textSize.height + underlineMaxHeight,
      child: Column(
        children: [
          Expanded(
            child: FittedBox(
              child: AnimatedDefaultTextStyle(
                duration: duration,
                style: textStyle.copyWith(
                  color: isSelected ? selectedTextColor : unselectedTextColor,
                ),
                child: Text(text),
              ),
            ),
          ),
          AnimatedContainer(
            duration: duration,
            width: isSelected ? textSize.width : 0.0,
            height: isSelected ? underlineMaxHeight * 0.7 : underlineMaxHeight,
            decoration: BoxDecoration(
              color: theme.primaryColor,
              borderRadius: BorderRadius.circular(100),
            ),
          ),
        ],
      ),
    );
  }
}

extension TextStyleExtensions on TextStyle {
  Size calculateTextSize(BuildContext context, String label) {
    final textPainter = TextPainter(
      text: TextSpan(text: label, style: this),
      maxLines: 1,
      locale: Localizations.localeOf(context),
      textScaleFactor: MediaQuery.of(context).textScaleFactor,
      textDirection: Directionality.of(context),
    )..layout();
    return textPainter.size;
  }
}
