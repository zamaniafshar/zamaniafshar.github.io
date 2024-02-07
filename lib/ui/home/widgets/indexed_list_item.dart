import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:personal_website/providers/indexed_list_provider.dart';

final class IndexedItemList extends _IndexedItemListBase {
  const IndexedItemList({
    super.key,
    required super.index,
    required super.notifier,
    required super.child,
  }) : super(childType: _ChildType.normalWidget);
}

final class IndexedSliverItemList extends _IndexedItemListBase {
  const IndexedSliverItemList({
    super.key,
    required super.index,
    required super.notifier,
    required super.child,
  }) : super(childType: _ChildType.sliverWidget);
}

enum _ChildType { sliverWidget, normalWidget }

base class _IndexedItemListBase extends SingleChildRenderObjectWidget {
  const _IndexedItemListBase({
    super.key,
    required this.index,
    required this.notifier,
    required this.childType,
    required Widget child,
  }) : super(child: child);

  final int index;
  final IndexedListNotifier notifier;
  final _ChildType childType;

  @override
  RenderObject createRenderObject(BuildContext context) {
    return switch (childType) {
      _ChildType.sliverWidget => _IndexedListItemSliverRenderObject(_onWidgetHeightCalculated),
      _ChildType.normalWidget => _IndexedListItemRenderObject(_onWidgetHeightCalculated),
    };
  }

  void _onWidgetHeightCalculated(double height) {
    notifier.setItemHeight(index, height);
  }
}

final class _IndexedListItemRenderObject extends RenderProxyBox {
  _IndexedListItemRenderObject(this.onChildHeightCalculated);

  final void Function(double height) onChildHeightCalculated;
  double oldHeight = 0.0;

  @override
  void performLayout() {
    super.performLayout();

    final newHeight = child!.size.height;
    if (oldHeight == newHeight) return;

    oldHeight = newHeight;
    onChildHeightCalculated(newHeight);
  }
}

final class _IndexedListItemSliverRenderObject extends RenderProxySliver {
  _IndexedListItemSliverRenderObject(this.onChildHeightCalculated);

  final void Function(double height) onChildHeightCalculated;
  double oldHeight = 0.0;

  @override
  void performLayout() {
    super.performLayout();

    final newHeight = child!.constraints.remainingPaintExtent;
    if (oldHeight == newHeight) return;

    oldHeight = newHeight;
    onChildHeightCalculated(newHeight);
  }
}
