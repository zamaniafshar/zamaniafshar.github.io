import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:personal_website/ui/screens/home/providers/providers.dart';
import 'underline_text.dart';

class CustomNavigationBar extends HookConsumerWidget {
  const CustomNavigationBar({
    super.key,
    this.onChange,
    required this.unSelectedColor,
    this.axis = Axis.horizontal,
  });

  final void Function(int index)? onChange;
  final Color unSelectedColor;
  final Axis axis;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedIndex = ref.watch(navigationBarSelectedIndex);
    final localization = AppLocalizations.of(context)!;
    final theme = Theme.of(context);
    final List<String> labels = [
      localization.home,
      localization.aboutMe,
      localization.skills,
      localization.services,
      localization.contact,
    ];

    List<Widget> buildItems() {
      return [
        for (int i = 0; i < labels.length; i++)
          Expanded(
            child: NavigationItem(
              label: labels[i],
              selectedColor: theme.primaryColor,
              unSelectedColor: unSelectedColor,
              isSelected: selectedIndex == i,
              onTap: () {
                ref.read(navigationBarSelectedIndex.notifier).state = i;
                onChange?.call(i);
              },
            ),
          ),
      ];
    }

    if (axis == Axis.vertical) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: buildItems(),
      );
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: buildItems(),
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

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme.titleMedium!;
    final oldIsSelected = usePrevious(isSelected);
    final isSelectedState = useState(isSelected);
    if (oldIsSelected != isSelected) {
      isSelectedState.value = isSelected;
    }

    return MouseRegion(
      onEnter: (_) {
        isSelectedState.value = true;
      },
      onExit: (_) {
        if (!isSelected) isSelectedState.value = false;
      },
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: onTap,
        child: Center(
          child: AnimatedUnderlineText(
            duration: const Duration(milliseconds: 250),
            label: label,
            selectedColor: selectedColor,
            textStyle: textStyle.copyWith(color: unSelectedColor),
            selectedTextStyle: textStyle.copyWith(color: selectedColor),
            isSelected: isSelectedState.value,
          ),
        ),
      ),
    );
  }
}
