import 'package:flutter/material.dart';
import 'package:personal_website/common/responsive/responsive.dart';
import 'package:personal_website/ui/home/widgets/sliver_app_bar/widgets/home_welcome.dart';
import 'package:personal_website/ui/home/widgets/sliver_app_bar/widgets/home_appbar.dart';

class HomeSliverAppBar extends StatelessWidget {
  const HomeSliverAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final screen = Screen.of(context);

    return SliverAppBar(
      expandedHeight: screen.height,
      backgroundColor: theme.colorScheme.background,
      centerTitle: true,
      pinned: true,
      titleSpacing: 0,
      actions: const [SizedBox()],
      title: const HomeAppBar(),
      flexibleSpace: const HomeWelcome(),
    );
  }
}
