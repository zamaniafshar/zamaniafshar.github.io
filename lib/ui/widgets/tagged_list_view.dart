import 'package:flutter/material.dart';
import 'package:personal_website/provider/current_tag_notifier.dart';
import 'package:provider/provider.dart';

const _spaceFromTop = kToolbarHeight * 2;
const _currentItemVisibleArea = 300;

class TaggedListView extends StatefulWidget {
  const TaggedListView({
    super.key,
    required this.children,
    required this.scrollController,
  });

  final List<Widget> children;
  final ScrollController scrollController;

  @override
  State<TaggedListView> createState() => TaggedListViewState();

  static TaggedListViewState of(BuildContext context) {
    return context.findAncestorStateOfType<TaggedListViewState>()!;
  }
}

class TaggedListViewState extends State<TaggedListView> {
  late final _scrollController = widget.scrollController;
  final _itemsGlobalKeys = <String, GlobalKey>{};
  bool _isAnimating = false;

  @override
  void initState() {
    _scrollController.addListener(_scrollLister);
    context.read<CurrentTagNotifier>().addListener(_currentTagListener);

    super.initState();
  }

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

  void _currentTagListener() {
    final tag = context.read<CurrentTagNotifier>().value;
    _animateToTag(tag);
  }

  Future<void> _animateToTag(String tag) async {
    final globalKey = _itemsGlobalKeys[tag];
    final renderBox = globalKey!.currentContext!.findRenderObject() as RenderBox;
    final itemDistance = renderBox.localToGlobal(Offset.zero).dy;

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
    context.read<CurrentTagNotifier>().setTag(currentVisibleItemTag);
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

  @override
  Widget build(BuildContext context) {
    // I didn't use ListView or SliverList because of lag and performance issue
    return SingleChildScrollView(
      controller: _scrollController,
      child: Column(
        children: widget.children,
      ),
    );
  }
}
