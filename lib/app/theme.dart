import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  // Custom colors:
  static const Color black = Color(0xFF0B0A07);
  static const Color mocha = Color(0xFF3B322C);
  static const Color ash = Color(0xFFB2BCAA);
  static const Color olive = Color(0xFF838E83);
  static const Color lightAsh = Color(0xFFC9CEBD);
  static const Color graphite = Color(0xFF2D2D2A);

  // Actual color mappings:
  static const Color surface = lightAsh;
  static const Color onSurface = ash;
  static const Color primary = olive;
  static const Color onPrimary = graphite;
  static const Color secondary = mocha;
  static const Color onSecondary = graphite;
  static const Color text = graphite;

  // Derived colors (optional)
  static Color get hover => mocha.withValues(alpha: 0.25);
  static Color get border => mocha.withValues(alpha: 0.6);

  static ThemeData get darkTheme {
    final colorScheme = const ColorScheme.dark(
      brightness: Brightness.dark,
      primary: primary,
      onPrimary: onPrimary,
      secondary: secondary,
      onSecondary: onSecondary,
      surface: surface,
      onSurface: onSurface,
    );

    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      colorScheme: colorScheme,
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: primary,
        unselectedItemColor: onSurface,
        selectedItemColor: text,
      ),

      appBarTheme: const AppBarTheme(
        backgroundColor: primary,
        foregroundColor: onPrimary,
        elevation: 0,
      ),

      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: primary,
        foregroundColor: onPrimary,
      ),

      dialogTheme: const DialogThemeData(
        backgroundColor: onSurface,
        titleTextStyle: TextStyle(
          color: text,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        contentTextStyle: TextStyle(
          color: text,
          fontSize: 14,
        ),
      ),

      inputDecorationTheme: const InputDecorationTheme(
        filled: true,
        fillColor: onSurface,
        hintStyle: TextStyle(color: text),
        border: OutlineInputBorder(),
      ),

      textTheme: const TextTheme(
        bodyLarge: TextStyle(color: text, fontSize: 16),
        bodyMedium: TextStyle(color: text, fontSize: 14),
        titleLarge: TextStyle(
          color: text,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  // Keep reusable styles, but make them consume the palette
  static BoxDecoration nodeDecoration({
    required bool isDragged,
    Color? customColor,
  }) {
    final base = customColor ?? surface;

    return BoxDecoration(
      color: isDragged ? base.withValues(alpha: 0.85) : base.withValues(alpha: 0.35),
      shape: BoxShape.circle,
      border: Border.all(
        color: isDragged ? base : base.withValues(alpha: 0.6),
        width: isDragged ? 3 : 2,
      ),
    );
  }

  static const TextStyle nodeTextStyle = TextStyle(
    fontSize: 14,
    color: text,
    fontWeight: FontWeight.w500,
  );
}