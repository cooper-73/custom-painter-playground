import 'package:custom_painter_playground/core/theme/theme.dart';
import 'package:flutter/material.dart';

abstract class AppTheme {
  static final dark = ThemeData(
    useMaterial3: true,
    fontFamily: 'SpaceGrotesk',
    textTheme: AppTextTheme.textTheme,
    appBarTheme: const AppBarTheme(
      foregroundColor: AppColors.darkAppBarForeground,
      surfaceTintColor: Colors.transparent,
    ),
    navigationBarTheme: const NavigationBarThemeData(
      indicatorColor: Colors.transparent,
    ),
    colorScheme:
        ColorScheme.fromSeed(
          seedColor: AppColors.darkPrimaryContainer,
          brightness: Brightness.dark,
        ).copyWith(
          primary: AppColors.darkPrimary,
          primaryContainer: AppColors.darkPrimaryContainer,
          secondary: AppColors.darkSecondary,
          onSecondary: AppColors.darkOnSecondary,
          onSecondaryContainer: AppColors.darkOnSecondaryContainer,
          surface: AppColors.darkSurface,
          surfaceContainer: AppColors.darkSurface,
          surfaceContainerHighest: AppColors.darkSurfaceContainerHighest,
          surfaceContainerLow: AppColors.darkSurfaceContainerLow,
          onSurface: AppColors.darkOnSurface,
          onSurfaceVariant: AppColors.darkOnSurfaceVariant,
          outline: AppColors.darkOutline,
          outlineVariant: AppColors.darkOutlineVariant,
        ),
  );
}
