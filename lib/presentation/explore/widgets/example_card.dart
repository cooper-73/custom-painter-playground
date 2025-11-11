import 'package:custom_painter_playground/core/core.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ExampleCard extends StatelessWidget {
  const ExampleCard({
    super.key,
    required this.patternKind,
  });

  final PatternKind patternKind;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.push(AppRoutes.playgroundPath(patternKind.name)),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Stack(
          children: [
            const _Background(),
            const _GradientMask(),
            _Title(title: patternKind.title),
          ],
        ),
      ),
    );
  }
}

class _Background extends StatelessWidget {
  const _Background();

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Image.network(
        'https://www.artfulmaths.com/uploads/5/2/0/5/52054835/img-6339.jpg',
        fit: BoxFit.cover,
      ),
    );
  }
}

class _Title extends StatelessWidget {
  const _Title({required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    final textTheme = TextTheme.of(context);

    return Positioned(
      bottom: 12,
      left: 12,
      right: 12,
      child: Text(
        title,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: textTheme.titleMedium,
      ),
    );
  }
}

class _GradientMask extends StatelessWidget {
  const _GradientMask();

  @override
  Widget build(BuildContext context) {
    return const Positioned.fill(
      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [Colors.black54, Colors.black12],
          ),
        ),
      ),
    );
  }
}
