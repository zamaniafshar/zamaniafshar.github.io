import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:personal_website/common/responsive/responsive.dart';
import 'package:personal_website/providers/indexed_list_povider.dart';
import 'package:personal_website/ui/home/widgets/indexed_list_item.dart';
import 'package:personal_website/ui/home/widgets/about_me/about_me.dart';
import 'package:personal_website/ui/home/widgets/contact_me/contact_me.dart';
import 'package:personal_website/ui/home/widgets/my_services/my_services.dart';
import 'package:personal_website/ui/home/widgets/my_skills/my_skills.dart';
import 'package:personal_website/ui/home/widgets/sliver_app_bar/sliver_appbar.dart';

import 'widgets/sliver_app_bar/widgets/home_drawer.dart';

class HomeScreen extends HookConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final screen = Screen.of(context);
    final isSmallScreen = !screen.type.isDesktop;
    final drawer = isSmallScreen ? const HomeDrawer() : null;

    return Scaffold(
      endDrawer: drawer,
      body: CustomScrollView(
        shrinkWrap: true,
        controller: ref.watch(homeScrollControllerProvider),
        slivers: [
          IndexedSliverItemList(
            index: 0,
            notifier: ref.watch(indexedListNotifierProvider.notifier),
            child: const HomeSliverAppBar(),
          ),
          const HomeSliverListContent(),
        ],
      ),
    );
  }
}

class HomeSliverListContent extends HookConsumerWidget {
  const HomeSliverListContent({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final screen = Screen.of(context);
    final indexedListNotifier = ref.watch(indexedListNotifierProvider.notifier);

    final widgets = [
      Padding(
        padding: EdgeInsets.only(
          top: screen.h(25),
          bottom: screen.h(7.5),
        ),
        child: const AboutMe(),
      ),
      Padding(
        padding: EdgeInsets.only(
          top: screen.h(7.5),
          bottom: screen.h(10),
        ),
        child: const MySkills(),
      ),
      Padding(
        padding: EdgeInsets.symmetric(
          vertical: screen.h(10),
        ),
        child: const MyServices(),
      ),
      Padding(
        padding: EdgeInsets.symmetric(
          vertical: screen.h(10),
        ),
        child: const ContactMe(),
      ),
    ];

    return SliverToBoxAdapter(
      child: ListView(
        shrinkWrap: true,
        children: [
          for (int i = 0; i < widgets.length; i++)
            IndexedItemList(
              // because we already add another IndexedListItem for SliverAppBar we start from 1
              index: i + 1,
              notifier: indexedListNotifier,
              child: widgets[i],
            ),
        ],
      ),
    );
  }
}
