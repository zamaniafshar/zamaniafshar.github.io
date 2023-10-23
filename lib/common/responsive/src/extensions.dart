import 'package:flutter/material.dart';
import 'package:personal_website/common/responsive/src/screen_data.dart';

extension HelperExtension on ScreenData {
  double get width => size.width;
  double get height => size.height;
  double h(double value) => value / 100 * height;
  double w(double value) => value / 100 * width;
  Widget horizontalSpace(double value) => SizedBox(width: w(value));
  Widget verticalSpace(double value) => SizedBox(height: h(value));

  EdgeInsets get contentPadding => EdgeInsets.symmetric(
        horizontal: fromMTD(
          20,
          50,
          fromDesktop(w(5), w(10), w(15)),
        ),
      );

  T fromMTD<T>(T mobile, T tablet, T desktop) {
    if (type.isMobile) return mobile;
    if (type.isTablet) return tablet;
    return desktop;
  }

  T fromDesktop<T>(T small, T medium, T large) {
    if (type.isSmallDesktop) return small;
    if (type.isMediumDesktop) return medium;
    return large;
  }

  T fromMobile<T>(T small, T medium, T large) {
    if (type.isSmallMobile) return small;
    if (type.isMediumMobile) return medium;
    return large;
  }

  T fromTablet<T>(T small, T large) {
    if (type.isSmallTablet) return small;
    return large;
  }

  T? adaptive<T>({
    T? defaultValue,
    T? mobile,
    T? tablet,
    T? desktop,
  }) {
    assert(mobile != null || tablet != null || desktop != null || defaultValue != null);
    if (type.isMobile && mobile != null) return mobile;
    if (type.isTablet && tablet != null) return tablet;
    if (type.isDesktop && desktop != null) return desktop;
    return defaultValue;
  }
}
