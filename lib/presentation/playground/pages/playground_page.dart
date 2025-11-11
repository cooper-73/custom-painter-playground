import 'package:custom_painter_playground/core/core.dart';
import 'package:flutter/material.dart';

class PlaygroundPage extends StatelessWidget {
  const PlaygroundPage({
    super.key,
    required this.patternKind,
  });

  final PatternKind patternKind;

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: patternKind.title,
      centerTitle: true,
      body: const Center(
        child: Text('Playground Page'),
      ),
    );
  }
}
