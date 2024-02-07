import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

const _appBarHeight = 80;

typedef CurrentIndex = int;

final homeScrollControllerProvider = Provider((ref) {
  return ScrollController();
});

final indexedListNotifierProvider =
    NotifierProvider<IndexedListNotifier, CurrentIndex>(IndexedListNotifier.new);

final class IndexedListNotifier extends Notifier<CurrentIndex> {
  @override
  build() {
    _scrollController = ref.watch(homeScrollControllerProvider);
    _scrollController.addListener(_calculateCurrentVisibleWidgetIndex);

    ref.onDispose(_dispose);
    return 0;
  }

  late ScrollController _scrollController;
  final _itemsHeights = <double>[];

  void _dispose() {
    _scrollController.removeListener(_calculateCurrentVisibleWidgetIndex);
    _scrollController.dispose();
  }

  void setItemHeight(int index, double height) {
    final isAlreadyAdded = _itemsHeights.elementAtOrNull(index) != null;
    if (isAlreadyAdded) {
      _itemsHeights[index] = height;
    } else {
      _itemsHeights.add(height);
    }
  }

  Future<void> animateToIndex(int index) {
    final itemOffset = _calculateAnimateToIndexOffset(index);
    return _scrollController.animateTo(
      itemOffset,
      duration: const Duration(seconds: 1),
      curve: Curves.easeInOut,
    );
  }

  Future<void> animateToLast() {
    return animateToIndex(_itemsHeights.length - 1);
  }

  double _calculateAnimateToIndexOffset(int index) {
    if (index == 0) return 0.0;
    return _calculateOffsetOf(index) - _appBarHeight;
  }

  double _calculateOffsetOf(int index) {
    double offset = 0.0;
    for (int i = 0; i < index; i++) {
      final itemHeight = _itemsHeights[i];
      offset += itemHeight;
    }

    return offset;
  }

  void _calculateCurrentVisibleWidgetIndex() {
    state = _calculateCurrentIndex();
  }

  int _calculateCurrentIndex() {
    double offset = 0.0;
    for (int i = 0; i < _itemsHeights.length; i++) {
      offset += _itemsHeights[i];
      if (_scrollController.offset + _appBarHeight < offset) return i;
    }
    throw StateError('Could not find current index');
  }
}
