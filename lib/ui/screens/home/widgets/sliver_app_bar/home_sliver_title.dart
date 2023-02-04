import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:personal_website/ui/screens/home/providers/providers.dart';
import 'package:personal_website/ui/screens/home/widgets/sliver_app_bar/custom_navigation_bar.dart';

class HomeSliverTitle extends HookConsumerWidget {
  const HomeSliverTitle({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final animation = useState(0.0);
    final maxArea = MediaQuery.of(context).size.height - kToolbarHeight;
    final minArea = maxArea - kToolbarHeight * 2;
    useEffect(() {
      final controller = ref.read(scrollControllerProvider);
      controller.addListener(
        () {
          animation.value = max(0.0, controller.offset - minArea) / (maxArea - minArea);
        },
      );
      return null;
    }, [0]);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          "Zamani.afshar",
          style: theme.textTheme.headlineLarge!.copyWith(
            fontFamily: 'SassyFrass',
            fontWeight: FontWeight.bold,
            color: Color.lerp(Colors.white, Colors.black, animation.value),
          ),
        ),
        75.horizontalSpace,
        CustomNavigationBar(
          unSelectedColor: Color.lerp(
            Colors.white,
            theme.colorScheme.onBackground,
            animation.value,
          )!,
        ),
      ],
    );
  }
}
