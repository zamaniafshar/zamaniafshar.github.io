import 'package:flutter/material.dart';
import 'package:personal_website/ui/sliver_app_bar/change_language_menu_button.dart';
import 'package:personal_website/ui/sliver_app_bar/custom_navigation_bar.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          const Align(
            alignment: Alignment.centerLeft,
            child: ChangeLanguageMenuButton(),
          ),
          Expanded(
            child: FractionallySizedBox(
              heightFactor: 0.8,
              child: CustomNavigationBar(
                direction: Axis.vertical,
                onChange: (_) {
                  Scaffold.of(context).closeEndDrawer();
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
