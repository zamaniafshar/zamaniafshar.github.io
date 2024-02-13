import 'package:flutter/material.dart';
import 'package:personal_website/common/responsive/responsive.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    super.key,
    this.onPressed,
    this.backgroundColor,
    this.borderRadius,
    this.borderSide,
    this.foregroundColor,
    this.gradientBackground,
    this.padding,
    this.height,
    this.width,
    this.elevation = 5,
    required this.child,
  });

  final void Function()? onPressed;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final Gradient? gradientBackground;
  final BorderSide? borderSide;
  final EdgeInsets? padding;
  final BorderRadius? borderRadius;
  final double elevation;
  final double? width;
  final double? height;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final screen = Screen.of(context);
    final theme = Theme.of(context);

    final borderRadius = this.borderRadius ?? BorderRadius.circular(10);
    final padding = this.padding ??
        EdgeInsets.symmetric(
          horizontal: screen.fromMTD(20, 25, 40),
          vertical: screen.fromMTD(10, 15, 15),
        );

    final foregroundColor = this.foregroundColor ?? theme.colorScheme.surface;
    Color? backgroundColor;
    if (gradientBackground == null) {
      backgroundColor = this.backgroundColor ?? theme.primaryColor;
    }

    final heightWithPadding = height != null ? height! + padding.vertical : null;
    final widthWithPadding = width != null ? width! + padding.horizontal : null;

    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        foregroundColor: foregroundColor,
        backgroundColor: Colors.transparent,
        shape: RoundedRectangleBorder(borderRadius: borderRadius),
        elevation: elevation,
        padding: EdgeInsets.zero,
        side: borderSide,
        textStyle: TextStyle(fontSize: screen.fromMTD(14, 16, 18)),
      ),
      child: SizedBox(
        height: heightWithPadding,
        width: widthWithPadding,
        child: Ink(
          decoration: BoxDecoration(
            borderRadius: borderRadius,
            color: backgroundColor,
            gradient: gradientBackground,
          ),
          child: Container(
            alignment: width != null || height != null ? Alignment.center : null,
            padding: padding,
            child: child,
          ),
        ),
      ),
    );
  }
}
