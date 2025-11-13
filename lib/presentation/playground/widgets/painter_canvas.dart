import 'dart:math';

import 'package:flutter/material.dart';

class PainterCanvas extends StatelessWidget {
  const PainterCanvas({
    super.key,
    required this.extent,
  });

  final double extent;

  static const _horizontalPadding = 16.0;
  static const _verticalPadding = 20.0;

  double _calculateCanvasDimension(double parentHeight, double parentWidth) {
    final availableHeight = parentHeight - (2 * _verticalPadding);
    final availableWidth = parentWidth - (2 * _horizontalPadding);

    return min(availableHeight, availableWidth);
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final totalHeight = constraints.maxHeight;
        final totalWidth = constraints.maxWidth;

        final containerHeight = totalHeight * (1 - extent);
        final canvasDimension = _calculateCanvasDimension(containerHeight, totalWidth);

        return SizedBox(
          height: containerHeight,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: _horizontalPadding,
              vertical: _verticalPadding,
            ),
            child: Center(
              child: SizedBox.square(
                dimension: canvasDimension,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: Colors.redAccent,
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
