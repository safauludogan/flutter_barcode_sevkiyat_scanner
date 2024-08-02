import 'package:flutter/material.dart';

class CustomRefreshIndicator extends StatelessWidget {
  const CustomRefreshIndicator({
    required this.onRefresh,
    this.centerChild,
    required this.child,
    this.isListView = false,
    super.key,
  });

  /// Get data onRefresh
  final Future<void> Function() onRefresh;

  /// [false] in you want center child
  final bool? centerChild;

  /// If child is list set true [isListView]
  /// Than page height set automatic
  final bool isListView;

  /// Child widget
  final Widget child;
  @override
  Widget build(BuildContext context) {
    if (isListView) {
      return RefreshIndicator(
        onRefresh: onRefresh,
        child: SizedBox(height: double.infinity, child: child),
      );
    }
    return RefreshIndicator(
      onRefresh: onRefresh,
      child: centerChild ?? true ? _body : Center(child: _body),
    );
  }

  Widget get _body => LayoutBuilder(
        builder: (context, constraints) => SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: constraints.maxHeight),
            child: IntrinsicHeight(child: child),
          ),
        ),
      );
}