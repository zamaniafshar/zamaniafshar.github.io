import 'package:flutter/material.dart';
import 'package:personal_website/common/responsive/src/screen_data.dart';
import 'package:personal_website/common/responsive/src/screen_type.dart';

class Screen extends InheritedWidget {
  Screen({
    super.key,
    required super.child,
    required MediaQueryData mediaQueryData,
  }) : screenData = ScreenData(
          type: getScreenType(mediaQueryData),
          size: mediaQueryData.size,
        );

  final ScreenData screenData;
  @override
  bool updateShouldNotify(covariant Screen oldWidget) {
    return oldWidget.screenData != screenData;
  }

  static ScreenData of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<Screen>()!.screenData;
  }
}
