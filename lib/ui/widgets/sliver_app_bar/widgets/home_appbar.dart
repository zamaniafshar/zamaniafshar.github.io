import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:personal_website/common/responsive/responsive.dart';
import 'package:personal_website/providers/providers.dart';
import 'package:personal_website/ui/widgets/sliver_app_bar/widgets/custom_navigation_bar.dart';

class HomeAppBar extends HookConsumerWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final screen = Screen.of(context);
    final theme = Theme.of(context);

    final animation = useState(0.0);
    final maxArea = MediaQuery.of(context).size.height - kToolbarHeight;
    final minArea = maxArea - kToolbarHeight;

    useEffect(() {
      final controller = ref.read(scrollControllerProvider);
      controller.addListener(
        () {
          final offset = controller.offset.clamp(minArea, maxArea);
          final minus = maxArea - offset;
          final value = minus / kToolbarHeight;
          animation.value = 1 - value;
        },
      );
      return null;
    }, const []);

    final color = Color.lerp(
      Colors.white,
      Colors.black,
      animation.value,
    )!;

    return Theme(
      data: theme.copyWith(
        colorScheme: theme.colorScheme.copyWith(
          onSurface: color,
        ),
      ),
      child: Container(
        height: kToolbarHeight,
        padding: screen.contentPadding,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "Zamani.afshar",
              style: theme.textTheme.headlineLarge!.copyWith(
                fontFamily: 'SassyFrass',
                fontWeight: FontWeight.bold,
                color: color,
              ),
            ),
            Expanded(
              child: FractionallySizedBox(
                widthFactor: screen.adaptive(tablet: 0.9, desktop: 0.7),
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
                            color: color,
                          ),
                        ),
                      );
                    }
                    return const CustomNavigationBar();
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
