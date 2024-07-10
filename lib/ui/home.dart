import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:personal_website/responsive/responsive.dart';
import 'package:personal_website/config/constants/home_items_tags.dart';
import 'package:personal_website/provider/tagged_list_provider.dart';
import 'package:personal_website/ui/widgets/auto_tagged_item.dart';
import 'package:personal_website/ui/about_me/about_me.dart';
import 'package:personal_website/ui/contact_me/contact_me.dart';
import 'package:personal_website/ui/my_services/my_services.dart';
import 'package:personal_website/ui/my_skills/my_skills.dart';
import 'package:personal_website/ui/home_welcome.dart';
import 'package:personal_website/ui/sliver_app_bar/home_appbar.dart';

import 'sliver_app_bar/home_drawer.dart';

class HomeScreen extends HookConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final screen = Screen.of(context);
    final isSmallScreen = !screen.type.isDesktop;
    final drawer = isSmallScreen ? const HomeDrawer() : null;
    final isKeyboardClose = MediaQuery.viewInsetsOf(context).bottom == 0.0;

    return Scaffold(
      endDrawer: drawer,
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          const HomeSliverListContent(),
          if (isKeyboardClose) const HomeAppBar(),
        ],
      ),
    );
  }
}

class HomeSliverListContent extends ConsumerWidget {
  const HomeSliverListContent({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final screen = Screen.of(context);

    // I didn't use ListView or SliverList because of lag and performance issue
    return SingleChildScrollView(
      controller: ref.watch(homeScrollControllerProvider),
      child: Column(
        children: [
          const AutoTaggedItem(
            tag: kHomeWelcomeItemTag,
            child: HomeWelcome(),
          ),
          screen.verticalSpace(30),
          const AutoTaggedItem(
            tag: kHomeAboutMeItemTag,
            child: AboutMe(),
          ),
          screen.verticalSpace(15),
          const AutoTaggedItem(
            tag: kHomeMySkillsItemTag,
            child: MySkills(),
          ),
          screen.verticalSpace(30),
          const AutoTaggedItem(
            tag: kHomeMyServicesTag,
            child: MyServices(),
          ),
          screen.verticalSpace(30),
          const AutoTaggedItem(
            tag: kHomeContactMeItemTag,
            child: ContactMe(),
          ),
          screen.verticalSpace(10),
        ],
      ),
    );
  }
}
