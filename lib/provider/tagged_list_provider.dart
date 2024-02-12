import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:personal_website/config/constants/home_items_tags.dart';

const _spaceFromTop = kToolbarHeight * 2;
const _currentItemVisibleArea = 300;

typedef CurrentVisibleItemTag = String;

final homeScrollControllerProvider = Provider((ref) {
  return ScrollController();
});

final taggedListNotifierProvider =
    NotifierProvider<TaggedListNotifier, CurrentVisibleItemTag>(TaggedListNotifier.new);

// Because of using SingleChildScrollView all widgets build in the first time and all of them stay alive
// So globalKey.currentContext will never be null
final class TaggedListNotifier extends Notifier<CurrentVisibleItemTag> {
  @override
  build() {
    _scrollController = ref.watch(homeScrollControllerProvider);
    _scrollController.addListener(_scrollLister);

    ref.onDispose(_dispose);
    return kHomeWelcomeItemTag;
  }

  void _dispose() {
    _scrollController.removeListener(_scrollLister);
    _scrollController.dispose();
  }

  late ScrollController _scrollController;
  final _itemsGlobalKeys = <String, GlobalKey>{};
  bool _isAnimating = false;

  GlobalKey generateItemKey(String tag) {
    final isAlreadyAdded = _itemsGlobalKeys.containsKey(tag);
    if (isAlreadyAdded) {
      return _itemsGlobalKeys[tag]!;
    } else {
      final globalKey = GlobalKey();
      _itemsGlobalKeys[tag] = globalKey;
      return globalKey;
    }
  }

  Future<void> animateToTag(String tag) async {
    final globalKey = _itemsGlobalKeys[tag];
    final renderBox = globalKey!.currentContext!.findRenderObject() as RenderBox;
    final itemDistance = renderBox.localToGlobal(Offset.zero).dy;

    state = tag;
    _isAnimating = true;
    await _scrollController.animateTo(
      _scrollController.offset + itemDistance - _spaceFromTop,
      curve: Curves.easeInOut,
      duration: const Duration(seconds: 1),
    );
    _isAnimating = false;
  }

  void _scrollLister() {
    if (_isAnimating) return;
    final currentVisibleItemTag = _findCurrentVisibleItemTag();
    if (currentVisibleItemTag == null) return;
    state = currentVisibleItemTag;
  }

  String? _findCurrentVisibleItemTag() {
    for (String key in _itemsGlobalKeys.keys) {
      final globalKey = _itemsGlobalKeys[key];
      final renderBox = globalKey!.currentContext!.findRenderObject() as RenderBox;
      final itemDistance = renderBox.localToGlobal(Offset.zero).dy;
      if (itemDistance.abs() < _currentItemVisibleArea) {
        return key;
      }
    }
    return null;
  }
}
