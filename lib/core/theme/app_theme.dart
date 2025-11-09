import 'package:custom_painter_playground/core/theme/theme.dart';
import 'package:flutter/material.dart';

abstract class AppTheme {
  static final dark = ThemeData(
    useMaterial3: true,
    fontFamily: 'SpaceGrotesk',
    textTheme: AppTextTheme.textTheme,
    appBarTheme: const AppBarTheme(
      foregroundColor: AppDarkThemeColors.appBarForeground,
      surfaceTintColor: Colors.transparent,
    ),
    navigationBarTheme: NavigationBarThemeData(
      indicatorColor: Colors.transparent,
      labelTextStyle: WidgetStateProperty.fromMap({
        WidgetState.selected: AppTextTheme.textTheme.labelLarge!.copyWith(
          color: AppDarkThemeColors.bottomBarSelected,
        ),
      }),
      iconTheme: const WidgetStateProperty.fromMap({
        WidgetState.selected: IconThemeData(
          color: AppDarkThemeColors.bottomBarSelected,
        ),
      }),
    ),
    colorScheme:
        ColorScheme.fromSeed(
          seedColor: AppDarkThemeColors.primaryContainer,
          brightness: Brightness.dark,
        ).copyWith(
          primary: AppDarkThemeColors.primary,
          primaryContainer: AppDarkThemeColors.primaryContainer,
          secondary: AppDarkThemeColors.secondary,
          onSecondary: AppDarkThemeColors.onSecondary,
          surface: AppDarkThemeColors.surface,
          surfaceContainer: AppDarkThemeColors.surface,
          surfaceContainerHighest: AppDarkThemeColors.surfaceContainerHighest,
          surfaceContainerLow: AppDarkThemeColors.surfaceContainerLow,
          onSurface: AppDarkThemeColors.onSurface,
          onSurfaceVariant: AppDarkThemeColors.onSurfaceVariant,
          outline: AppDarkThemeColors.outline,
          outlineVariant: AppDarkThemeColors.outlineVariant,
        ),
  );
}
