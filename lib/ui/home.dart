import 'package:flutter/material.dart';
import 'package:personal_website/responsive/responsive.dart';
import 'package:personal_website/config/constants/home_items_tags.dart';
import 'package:personal_website/ui/widgets/auto_tagged_item.dart';
import 'package:personal_website/ui/about_me/about_me.dart';
import 'package:personal_website/ui/contact_me/contact_me.dart';
import 'package:personal_website/ui/my_services/my_services.dart';
import 'package:personal_website/ui/my_skills/my_skills.dart';
import 'package:personal_website/ui/home_welcome.dart';
import 'package:personal_website/ui/sliver_app_bar/home_appbar.dart';

import 'sliver_app_bar/home_drawer.dart';
import 'widgets/tagged_list_view.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final scrollController = ScrollController();

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screen = Screen.of(context);
    final isSmallScreen = !screen.type.isDesktop;
    final drawer = isSmallScreen ? const HomeDrawer() : null;
    final isKeyboardClose = MediaQuery.viewInsetsOf(context).bottom == 0.0;

    return Scaffold(
      endDrawer: drawer,
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          TaggedListView(
            scrollController: scrollController,
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
          if (isKeyboardClose)
            HomeAppBar(
              scrollController: scrollController,
            ),
        ],
      ),
    );
  }
}
