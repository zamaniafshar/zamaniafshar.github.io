import 'package:flutter/material.dart';

import 'screen_type.dart';

class ScreenData {
  const ScreenData({
    required this.type,
    required this.size,
  });

  final ScreenType type;
  final Size size;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ScreenData && other.type == type && other.size == size;
  }

  @override
  int get hashCode => type.hashCode ^ size.hashCode;
}
