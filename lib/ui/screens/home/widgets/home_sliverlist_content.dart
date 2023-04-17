import 'package:flutter/material.dart';
import 'package:personal_website/core/responsive/screen.dart';
import 'package:personal_website/ui/screens/home/widgets/my_skills.dart';

import 'about_me.dart';
import 'my_services/my_services.dart';

class HomeSliverListContent extends StatelessWidget {
  const HomeSliverListContent({super.key});

  @override
  Widget build(BuildContext context) {
    final screen = Screen.of(context);
    return SliverList(
      delegate: SliverChildListDelegate.fixed(
        [
          const AboutMe(),
          const MySkills(),
          // const MyServices(),
          screen.verticalSpace(1),
        ],
      ),
    );
  }
}
