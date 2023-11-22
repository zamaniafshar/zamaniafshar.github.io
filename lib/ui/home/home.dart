import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:personal_website/common/responsive/responsive.dart';
import 'package:personal_website/providers/providers.dart';
import 'package:personal_website/ui/home/widgets/about_me/about_me.dart';
import 'package:personal_website/ui/home/widgets/contact_me/contact_me.dart';
import 'package:personal_website/ui/home/widgets/my_services/my_services.dart';
import 'package:personal_website/ui/home/widgets/my_skills/my_skills.dart';
import 'package:personal_website/ui/home/widgets/sliver_app_bar/home_sliver_appbar.dart';

import 'widgets/sliver_app_bar/widgets/home_drawer.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final screen = Screen.of(context);

    final isSmallScreen = screen.width < kMinLargeTabletWidth;

    return Scaffold(
      endDrawer: isSmallScreen ? const HomeDrawer() : null,
      body: CustomScrollView(
        controller: ref.read(scrollControllerProvider),
        slivers: const [
          HomeSliverAppBar(),
          HomeSliverListContent(),
        ],
      ),
    );
  }
}

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
          screen.verticalSpace(20),
          const MyServices(),
          screen.verticalSpace(20),
          const ContactMe(),
          screen.verticalSpace(5),
        ],
      ),
    );
  }
}
