import 'dart:math';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:personal_website/common/responsive/responsive.dart';
import 'package:personal_website/ui/screens/home/providers/providers.dart';
import 'package:personal_website/ui/screens/home/widgets/sliver_app_bar/custom_navigation_bar.dart';

class HomeSliverTitle extends HookConsumerWidget {
  const HomeSliverTitle({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final screen = Screen.of(context);
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

    final unSelectedColor = Color.lerp(
      Colors.white,
      theme.colorScheme.onBackground,
      animation.value,
    )!;

    return Container(
      height: kToolbarHeight,
      padding: EdgeInsets.symmetric(
        horizontal: screen.fromMTD(15, 40, screen.w(0.1)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            "Zamani.afshar",
            style: theme.textTheme.headlineLarge!.copyWith(
              fontFamily: 'SassyFrass',
              fontWeight: FontWeight.bold,
              color: Color.lerp(Colors.white, Colors.black, animation.value),
            ),
          ),
          Expanded(
            flex: 2,
            child: FractionallySizedBox(
              widthFactor: screen.adaptive(tablet: 0.85, desktop: 0.7),
              alignment: Alignment.centerRight,
              child: Builder(
                builder: (context) {
                  if (screen.width < kMinLargeTabletWidth) {
                    return Align(
                      alignment: Alignment.centerRight,
                      child: IconButton(
                        onPressed: () {
                          Scaffold.of(context).openEndDrawer();
                        },
                        iconSize: 35,
                        icon: Icon(
                          Icons.menu,
                          fill: 1,
                          color: unSelectedColor,
                        ),
                      ),
                    );
                  }
                  return CustomNavigationBar(
                    unSelectedColor: unSelectedColor,
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
