import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:personal_website/config/constants/home_items_tags.dart';
import 'package:personal_website/provider/current_tag_notifier.dart';
import 'package:provider/provider.dart';
import '../widgets/animated_underline_text.dart';

class CustomNavigationBar extends StatelessWidget {
  const CustomNavigationBar({
    super.key,
    this.onChange,
    this.direction = Axis.horizontal,
  });

  final void Function(String tag)? onChange;
  final Axis direction;

  @override
  Widget build(BuildContext context) {
    final selectedTag = Provider.of<CurrentTagNotifier>(context).value;
    final localization = AppLocalizations.of(context)!;

    final items = {
      kHomeWelcomeItemTag: localization.home,
      kHomeAboutMeItemTag: localization.aboutMe,
      kHomeMySkillsItemTag: localization.skills,
      kHomeMyServicesTag: localization.services,
      kHomeContactMeItemTag: localization.contact,
    };

    List<Widget> buildItems() {
      return [
        for (String key in items.keys)
          Expanded(
            child: NavigationItem(
              text: items[key]!,
              isSelected: selectedTag == key,
              onTap: () {
                context.read<CurrentTagNotifier>().setTag(key);
                onChange?.call(key);
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
