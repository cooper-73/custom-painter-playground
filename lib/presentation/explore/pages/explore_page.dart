import 'package:custom_painter_playground/core/core.dart';
import 'package:custom_painter_playground/presentation/explore/explore.dart';
import 'package:flutter/material.dart';

class ExplorePage extends StatelessWidget {
  const ExplorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const AppScaffold(
      title: 'Custom Painter Playground',
      body: ExploreGrid(),
    );
  }
}
