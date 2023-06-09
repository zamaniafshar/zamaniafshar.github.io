import 'package:flutter/material.dart';
import 'package:personal_website/common/responsive/responsive.dart';
import 'package:personal_website/ui/screens/home/widgets/sliver_app_bar/custom_navigation_bar.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final screen = Screen.of(context);
    return Drawer(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: screen.h(20)),
        child: const CustomNavigationBar(
          unSelectedColor: Colors.black,
          axis: Axis.vertical,
        ),
      ),
    );
  }
}
