import 'package:flutter/material.dart';

abstract class AppTextTheme {
  static const textTheme = TextTheme(
    // AppBar titles, section headers ("Custom Painter Gallery", "Controls", "Appearance")
    titleLarge: TextStyle(
      fontSize: 22,
      fontWeight: FontWeight.bold,
      height: 23 / 18,
      letterSpacing: 0.15,
    ),
    // Card titles ("Spirograph", "Clock Face")
    titleMedium: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.bold,
      height: 20 / 16,
      letterSpacing: 0.1,
    ),
    // Small subtitles or labels ("Mathematical Art", "Fractals", "Basic Shapes")
    bodySmall: TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.normal,
      height: 18 / 12,
      letterSpacing: 0.25,
    ),
    // Button texts ("Play", "Reset", "Randomize")
    labelLarge: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.bold,
      height: 22 / 14,
      letterSpacing: 0.1,
    ),
    // Labels for sliders or settings ("Internal Radius", "External Radius")
    labelMedium: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      height: 24 / 16,
      letterSpacing: 0.1,
    ),
    // Secondary info texts or hints ("40.0", gray descriptions)
    bodyMedium: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.normal,
      height: 22 / 14,
      letterSpacing: 0.25,
    ),
  );
}
