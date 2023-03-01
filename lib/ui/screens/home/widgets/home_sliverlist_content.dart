import 'package:flutter/material.dart';
import 'package:personal_website/core/responsive/screen.dart';

import 'about_me.dart';

class HomeSliverListContent extends StatelessWidget {
  const HomeSliverListContent({super.key});

  @override
  Widget build(BuildContext context) {
    final screen = Screen.of(context);
    return SliverList(
      delegate: SliverChildListDelegate.fixed(
        [
          AboutMe(),
          screen.verticalSpace(1),
        ],
      ),
    );
  }
}
