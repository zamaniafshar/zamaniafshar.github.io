import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:personal_website/provider/tagged_list_provider.dart';

final class AutoTaggedItem extends ConsumerWidget {
  const AutoTaggedItem({
    super.key,
    required this.tag,
    required this.child,
  });

  final Widget child;
  final String tag;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      key: ref.watch(taggedListNotifierProvider.notifier).generateItemKey(tag),
      child: child,
    );
  }
}
