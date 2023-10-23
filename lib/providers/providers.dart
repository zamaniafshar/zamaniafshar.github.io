import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final navigationBarSelectedIndex = StateProvider((ref) => 0);

final scrollControllerProvider = Provider((ref) => ScrollController());
