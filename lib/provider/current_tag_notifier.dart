import 'package:flutter/material.dart';
import 'package:personal_website/config/constants/home_items_tags.dart';

class CurrentTagNotifier extends ValueNotifier<String> {
  CurrentTagNotifier() : super(kHomeWelcomeItemTag);

  void setTag(String tag) {
    value = tag;
  }
}
