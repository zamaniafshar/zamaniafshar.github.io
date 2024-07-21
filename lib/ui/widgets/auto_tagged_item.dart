import 'package:flutter/material.dart';
import 'package:personal_website/ui/widgets/tagged_list_view.dart';

final class AutoTaggedItem extends StatelessWidget {
  const AutoTaggedItem({
    super.key,
    required this.tag,
    required this.child,
  });

  final Widget child;
  final String tag;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      key: TaggedListView.of(context).generateItemKey(tag),
      child: child,
    );
  }
}
