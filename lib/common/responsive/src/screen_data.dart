import 'package:flutter/material.dart';

import 'screen_type.dart';

class ScreenData {
  const ScreenData({
    required this.type,
    required this.size,
  });

  final ScreenType type;
  final Size size;

  double get width => size.width;
  double get height => size.height;
  double h(double value) => value * height;
  double w(double value) => value * width;
  Widget horizontalSpace(double value) => SizedBox(width: w(value));
  Widget verticalSpace(double value) => SizedBox(height: h(value));

  T fromMTD<T>(T mobile, T tablet, T desktop) {
    if (type.isMobile) return mobile;
    if (type.isTablet) return tablet;
    return desktop;
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

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ScreenData && other.type == type && other.size == size;
  }

  @override
  int get hashCode => type.hashCode ^ size.hashCode;
}
