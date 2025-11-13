import 'package:flutter/material.dart';

class PainterControllerSheet extends StatelessWidget {
  const PainterControllerSheet({
    super.key,
    required this.animationControls,
    required this.painterControls,
  });

  final Widget animationControls;
  final List<Widget> painterControls;

  bool get _hasPainterControls => painterControls.isNotEmpty;

  static const defaultChildSize = 0.4;
  static const minimumChildSize = 0.22;
  static const _maximumChildSize = 0.6;

  @override
  Widget build(BuildContext context) {
    final colorScheme = ColorScheme.of(context);

    return DraggableScrollableSheet(
      initialChildSize: _hasPainterControls ? defaultChildSize : minimumChildSize,
      minChildSize: minimumChildSize,
      maxChildSize: _hasPainterControls ? _maximumChildSize : minimumChildSize,
      builder: (context, scrollController) {
        return DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: colorScheme.surfaceContainerLow,
          ),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: _PainterControllerSheetContent(
                scrollController: scrollController,
                animationControls: animationControls,
                painterControls: painterControls,
              ),
            ),
          ),
        );
      },
    );
  }
}

class _PainterControllerSheetContent extends StatelessWidget {
  const _PainterControllerSheetContent({
    required this.scrollController,
    required this.animationControls,
    required this.painterControls,
  });

  final ScrollController scrollController;
  final Widget animationControls;
  final List<Widget> painterControls;

  bool get _hasPainterControls => painterControls.isNotEmpty;

  @override
  Widget build(BuildContext context) {
    final textTheme = TextTheme.of(context);

    return CustomScrollView(
      controller: scrollController,
      physics: const ClampingScrollPhysics(),
      slivers: [
        SliverVisibility(
          visible: _hasPainterControls,
          maintainAnimation: true,
          maintainSize: true,
          maintainState: true,
          sliver: const SliverPersistentHeader(
            pinned: true,
            delegate: _Handlebar(),
          ),
        ),
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              animationControls,
              if (_hasPainterControls) ...[
                const SizedBox(height: 28),
                Text(
                  'Controls',
                  style: textTheme.titleLarge,
                ),
                const SizedBox(height: 28),
                ...painterControls,
              ],
            ],
          ),
        ),
      ],
    );
  }
}

class _Handlebar extends SliverPersistentHeaderDelegate {
  const _Handlebar();

  static const _padding = 12.0;
  static const _barHeight = 4.0;
  static const _barWidth = 40.0;

  double get _totalHeight => _barHeight + 2 * _padding + _padding;

  @override
  bool shouldRebuild(_) => false;

  @override
  double get maxExtent => _totalHeight;

  @override
  double get minExtent => _totalHeight;

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    final colorScheme = ColorScheme.of(context);

    return DecoratedBox(
      decoration: BoxDecoration(color: colorScheme.surfaceContainerLow),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(_padding).copyWith(bottom: 2 * _padding),
          child: SizedBox(
            height: _barHeight,
            width: _barWidth,
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: colorScheme.onSurfaceVariant,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
