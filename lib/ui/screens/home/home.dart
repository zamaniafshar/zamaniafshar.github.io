import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:personal_website/core/responsive/constants.dart';
import 'package:personal_website/core/responsive/screen.dart';
import 'package:personal_website/ui/screens/home/providers/providers.dart';
import 'package:personal_website/ui/screens/home/widgets/sliver_app_bar/home_sliver_appbar.dart';
import 'package:personal_website/ui/screens/home/widgets/home_sliverlist_content.dart';

import 'widgets/sliver_app_bar/home_drawer.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final screen = Screen.of(context);
    return Scaffold(
      endDrawer: screen.width < kMinLargeTabletWidth ? const HomeDrawer() : null,
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
