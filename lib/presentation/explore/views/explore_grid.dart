import 'package:custom_painter_playground/core/core.dart';
import 'package:custom_painter_playground/presentation/explore/explore.dart';
import 'package:flutter/material.dart';

class ExploreGrid extends StatelessWidget {
  const ExploreGrid({super.key});

  @override
  Widget build(BuildContext context) {
    const patternKinds = PatternKind.values;

    return GridView.builder(
      physics: const ClampingScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 270,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
      ),
      itemCount: patternKinds.length,
      itemBuilder: (context, index) => ExampleCard(
        patternKind: patternKinds[index],
      ),
    );
  }
}
