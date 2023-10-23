import 'package:flutter/material.dart';

import 'constants.dart';

enum ScreenType {
  smallHandset,
  mediumHandset,
  largeHandset,
  smallTablet,
  largeTablet,
  smallDesktop,
  mediumDesktop,
  largeDesktop;

  bool get isSmallMobile => this == smallHandset;
  bool get isMediumMobile => this == mediumHandset;
  bool get isLargeMobile => this == largeHandset;
  bool get isSmallTablet => this == smallTablet;
  bool get isLargeTablet => this == largeTablet;
  bool get isSmallDesktop => this == smallDesktop;
  bool get isMediumDesktop => this == mediumDesktop;
  bool get isLargeDesktop => this == largeDesktop;

  bool get isMobile => isSmallMobile || isMediumMobile || isLargeMobile;
  bool get isTablet => isSmallTablet || isLargeTablet;
  bool get isDesktop => isSmallDesktop || isMediumDesktop || isLargeDesktop;
}

ScreenType getScreenType(MediaQueryData mediaQueryData) {
  final double screenWidth = mediaQueryData.size.width;

  if (screenWidth < kMinMediumHandsetWidth) {
    return ScreenType.smallHandset;
  } else if (screenWidth < kMinLargeHandsetWidth) {
    return ScreenType.mediumHandset;
  } else if (screenWidth < kMinSmallTabletWidth) {
    return ScreenType.largeHandset;
  } else if (screenWidth < kMinLargeTabletWidth) {
    return ScreenType.smallTablet;
  } else if (screenWidth < kMinSmallDesktopWidth) {
    return ScreenType.largeTablet;
  } else if (screenWidth < kMinMediumDesktopWidth) {
    return ScreenType.smallDesktop;
  } else if (screenWidth < kMinLargeDesktopWidth) {
    return ScreenType.mediumDesktop;
  } else {
    return ScreenType.largeDesktop;
  }
}
