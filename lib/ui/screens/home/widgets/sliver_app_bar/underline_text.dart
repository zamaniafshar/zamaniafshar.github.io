import 'package:flutter/material.dart';

import 'package:personal_website/common/extensions/extensions.dart';

class AnimatedUnderlineText extends StatelessWidget {
  const AnimatedUnderlineText({
    Key? key,
    required this.label,
    required this.selectedColor,
    required this.textStyle,
    required this.isSelected,
    this.selectedTextStyle,
    this.duration = const Duration(seconds: 1),
  }) : super(key: key);

  final String label;
  final Color selectedColor;
  final TextStyle textStyle;
  final TextStyle? selectedTextStyle;
  final bool isSelected;
  final Duration duration;

  @override
  Widget build(BuildContext context) {
    final textSize = textStyle.calculateTextSize(context, label);
    final underlineMaxHeight = textSize.height * 0.15;
    return SizedBox(
      height: textSize.height + underlineMaxHeight,
      child: Column(
        children: [
          AnimatedDefaultTextStyle(
            duration: duration,
            style: isSelected && selectedTextStyle != null ? selectedTextStyle! : textStyle,
            child: Text(label),
          ),
          AnimatedContainer(
            duration: duration,
            width: isSelected ? textSize.width : 0.0,
            height: isSelected ? textSize.height * 0.1 : underlineMaxHeight,
            decoration: BoxDecoration(
              color: selectedColor,
              borderRadius: BorderRadius.circular(100),
            ),
          ),
        ],
      ),
    );
  }
}
