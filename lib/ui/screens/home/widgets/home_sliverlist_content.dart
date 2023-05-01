import 'package:flutter/material.dart';
import 'package:personal_website/common/responsive/responsive.dart';
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
          screen.verticalSpace(30),
          const AboutMe(),
          screen.verticalSpace(15),
          const MySkills(),
          screen.verticalSpace(30),
          const MyServices(),
          screen.verticalSpace(100),
        ],
      ),
    );
  }
}
