import 'package:flutter/material.dart';

class AnimationControls extends StatelessWidget {
  const AnimationControls({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = ColorScheme.of(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 12,
      children: [
        _AnimationControlButton(
          iconData: Icons.play_arrow_outlined,
          label: 'Play',
          foregroundColor: colorScheme.onSurface,
          backgroundColor: colorScheme.primary,
          onPressed: () {},
        ),
        _AnimationControlButton(
          iconData: Icons.replay_outlined,
          label: 'Reset',
          onPressed: () {},
        ),
        _AnimationControlButton(
          iconData: Icons.casino_outlined,
          label: 'Randomize',
          onPressed: () {},
        ),
      ],
    );
  }
}

class _AnimationControlButton extends StatelessWidget {
  const _AnimationControlButton({
    required this.iconData,
    required this.label,
    this.foregroundColor,
    this.backgroundColor,
    this.onPressed,
  });

  final IconData iconData;
  final String label;
  final Color? foregroundColor;
  final Color? backgroundColor;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final colorScheme = ColorScheme.of(context);
    final textTheme = TextTheme.of(context);

    return FilledButton(
      onPressed: onPressed,
      style: FilledButton.styleFrom(
        backgroundColor: backgroundColor ?? colorScheme.secondary,
        minimumSize: const Size(112, 72),
        maximumSize: const Size(112, 72),
        padding: const EdgeInsets.all(12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        overlayColor: colorScheme.onSurface.withValues(alpha: 0.12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            iconData,
            size: 24,
            color: foregroundColor ?? colorScheme.onSecondary,
          ),
          Text(
            label,
            overflow: TextOverflow.ellipsis,
            style: textTheme.labelLarge?.copyWith(
              color: foregroundColor ?? colorScheme.onSecondary,
            ),
          ),
        ],
      ),
    );
  }
}
