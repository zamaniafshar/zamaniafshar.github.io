import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:personal_website/providers/providers.dart';
import '../../animated_underline_text.dart';

class CustomNavigationBar extends HookConsumerWidget {
  const CustomNavigationBar({
    super.key,
    this.onChange,
    this.direction = Axis.horizontal,
  });

  final void Function(int index)? onChange;
  final Axis direction;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedIndex = ref.watch(navigationBarSelectedIndex);
    final localization = AppLocalizations.of(context)!;

    final List<String> items = [
      localization.home,
      localization.aboutMe,
      localization.skills,
      localization.services,
      localization.contact,
    ];

    List<Widget> buildItems() {
      return [
        for (int i = 0; i < items.length; i++)
          Expanded(
            child: NavigationItem(
              text: items[i],
              isSelected: selectedIndex == i,
              onTap: () {
                ref.watch(navigationBarSelectedIndex.notifier).state = i;
                onChange?.call(i);
              },
            ),
          ),
      ];
    }

    return Flex(
      direction: direction,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: buildItems(),
    );
  }
}

class NavigationItem extends HookWidget {
  const NavigationItem({
    Key? key,
    required this.text,
    required this.isSelected,
    required this.onTap,
  }) : super(key: key);

  final String text;
  final bool isSelected;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
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
            text: text,
            isSelected: isSelectedState.value,
          ),
        ),
      ),
    );
  }
}
