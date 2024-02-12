import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:personal_website/common/responsive/responsive.dart';
import 'package:personal_website/provider/tagged_list_provider.dart';
import 'package:personal_website/ui/home/widgets/sliver_app_bar/widgets/change_language_menu_button.dart';
import 'package:personal_website/ui/home/widgets/sliver_app_bar/widgets/custom_navigation_bar.dart';

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
      final controller = ref.read(homeScrollControllerProvider);
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

    final onSurfaceColor = Color.lerp(
      Colors.white,
      Colors.black,
      animation.value,
    )!;

    final appbarBackgroundColor = Color.lerp(
      Colors.transparent,
      Colors.white,
      animation.value,
    )!;

    final elevation = animation.value * 5;

    return Theme(
      data: theme.copyWith(
        colorScheme: theme.colorScheme.copyWith(
          onSurface: onSurfaceColor,
        ),
      ),
      child: PhysicalModel(
        color: appbarBackgroundColor,
        elevation: elevation,
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
                  color: onSurfaceColor,
                ),
              ),
              Expanded(
                child: Builder(
                  builder: (context) {
                    final isSmallScreen = !screen.type.isDesktop;

                    if (isSmallScreen) {
                      return Align(
                        alignment: AlignmentDirectional.centerEnd,
                        child: IconButton(
                          onPressed: Scaffold.of(context).openEndDrawer,
                          iconSize: 35,
                          icon: Icon(
                            Icons.menu,
                            fill: 1,
                            color: onSurfaceColor,
                          ),
                        ),
                      );
                    }
                    return const Row(
                      children: [
                        SizedBox(width: 100),
                        Expanded(
                          child: CustomNavigationBar(),
                        ),
                        SizedBox(width: 100),
                        ChangeLanguageMenuButton(),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size(double.infinity, kToolbarHeight);
}
