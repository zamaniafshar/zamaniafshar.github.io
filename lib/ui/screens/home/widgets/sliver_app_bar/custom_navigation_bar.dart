import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:personal_website/localization/app_localization.dart';

import 'package:personal_website/ui/screens/home/providers/providers.dart';

class CustomNavigationBar extends HookConsumerWidget {
  const CustomNavigationBar({
    super.key,
    this.onChange,
    required this.unSelectedColor,
  });

  final void Function(int index)? onChange;
  final Color unSelectedColor;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedIndex = ref.watch(navigationBarSelectedIndex);
    final localization = AppLocalization.of(context);
    final theme = Theme.of(context);
    final List<String> labels = [
      localization.home,
      localization.aboutMe,
      localization.skills,
      localization.services,
      localization.contact,
    ];

    return Container(
      padding: const EdgeInsets.only(top: 7),
      width: 600.w,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          for (int i = 0; i < labels.length; i++)
            NavigationItem(
              label: labels[i],
              selectedColor: theme.primaryColor,
              unSelectedColor: unSelectedColor,
              isSelected: selectedIndex == i,
              onTap: () {
                ref.read(navigationBarSelectedIndex.notifier).state = i;
                onChange?.call(i);
              },
            ),
        ],
      ),
    );
  }
}

class NavigationItem extends HookWidget {
  const NavigationItem({
    Key? key,
    required this.label,
    required this.selectedColor,
    required this.unSelectedColor,
    required this.isSelected,
    required this.onTap,
  }) : super(key: key);

  final String label;
  final Color selectedColor;
  final Color unSelectedColor;
  final bool isSelected;
  final void Function() onTap;

  Size calculateTextSize(BuildContext context, TextStyle style) {
    final textPainter = TextPainter(
      text: TextSpan(text: label, style: style),
      maxLines: 1,
      locale: AppLocalization.of(context).locale,
      textScaleFactor: MediaQuery.of(context).textScaleFactor,
      textDirection: Directionality.of(context),
    )..layout();
    return textPainter.size;
  }

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme.titleMedium!.copyWith(fontFamily: 'Vazir');
    final textSize = calculateTextSize(context, textStyle);
    final controller = useAnimationController(
      duration: const Duration(milliseconds: 200),
    );
    final oldIsSelected = usePrevious(isSelected);
    if (oldIsSelected != isSelected) {
      if (isSelected) {
        controller.forward();
      } else {
        controller.reverse();
      }
    }
    final heightAnimation = useMemoized(
      () => Tween(begin: 4.0, end: 2.0).animate(controller),
    );

    return MouseRegion(
      onEnter: (_) {
        controller.forward();
      },
      onExit: (_) {
        if (!isSelected) controller.reverse();
      },
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: onTap,
        child: Center(
          child: SizedBox(
            // text height + space + divider maxHeight
            height: textSize.height + 2 + 5,
            child: HookBuilder(
              builder: (context) {
                useAnimation(controller);
                return Column(
                  children: [
                    Text(
                      label,
                      style: textStyle.copyWith(
                        color: Color.lerp(
                          unSelectedColor,
                          selectedColor,
                          controller.value,
                        ),
                      ),
                    ),
                    2.verticalSpace,
                    Container(
                      width: controller.value * textSize.width,
                      height: heightAnimation.value,
                      decoration: BoxDecoration(
                        color: selectedColor,
                        borderRadius: BorderRadius.circular(5.r),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
