import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:personal_website/ui/screens/home/widgets/home_sliver_appbar.dart';
import 'package:personal_website/ui/screens/home/widgets/home_sliverlist_content.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CustomScrollView(
        slivers: [
          HomeSliverAppBar(),
          HomeSliverListContent(),
        ],
      ),
    );
  }
}
