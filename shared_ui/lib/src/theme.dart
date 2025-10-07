import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData light() {
    const primary = Color(0xFF006C4E); // emerald
    const secondary = Color(0xFF00B894); // mint
    return ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: primary).copyWith(
        primary: primary,
        secondary: secondary,
      ),
      useMaterial3: true,
      appBarTheme: const AppBarTheme(centerTitle: true),
      visualDensity: VisualDensity.adaptivePlatformDensity,
    );
  }
}