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
// Dark mode equivalents (keeps the same warm/olive “Bookwyrm” character,
// but flips the luminance so UI surfaces are dark and text is light).

// Custom colors (dark palette):
  static const Color blackDark = Color(0xFF0B0A07);
  static const Color mochaDark = Color(0xFF1C1713);
  static const Color ashDark = Color(0xFFB2BCAA);
  static const Color oliveDark = Color(0xFF6F7B6F);
  static const Color lightAshDark = Color(0xFF2B2E28);
  static const Color graphiteDark = Color(0xFF171715);

  // Actual color mappings:
  static const Color surface = lightAsh;
  static const Color onSurface = ash;
  static const Color primary = olive;
  static const Color onPrimary = graphite;
  static const Color secondary = mocha;
  static const Color onSecondary = graphite;
  static const Color text = graphite;

  // Actual color mappings (dark mode):
  static const Color surfaceDark = blackDark;
  static const Color onSurfaceDark = ashDark;
  static const Color primaryDark = oliveDark;
  static const Color onPrimaryDark = ashDark;
  static const Color secondaryDark = mochaDark;
  static const Color onSecondaryDark = ashDark;
  static const Color textDark = ashDark;

  static ThemeData get lightTheme{
    final colorScheme = const ColorScheme.light(
      brightness: Brightness.light,
      primary: primary,
      onPrimary: onPrimary,
      secondary: secondary,
      onSecondary: onSecondary,
      surface: surface,
      onSurface: onSurface,
    );

    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
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

  static ThemeData get darkTheme{
    final colorScheme = const ColorScheme.dark(
      brightness: Brightness.dark,
      primary: primaryDark,
      onPrimary: onPrimaryDark,
      secondary: secondaryDark,
      onSecondary: onSecondaryDark,
      surface: surfaceDark,
      onSurface: onSurfaceDark,
    );

    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      colorScheme: colorScheme,
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: primaryDark,
        unselectedItemColor: onSurfaceDark,
        selectedItemColor: textDark
      ),

      appBarTheme: const AppBarTheme(
        backgroundColor: primaryDark,
        foregroundColor: onPrimaryDark,
        elevation: 0,
      ),

      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: primaryDark,
        foregroundColor: onPrimaryDark,
      ),

      dialogTheme: const DialogThemeData(
        backgroundColor: onSurfaceDark,
        titleTextStyle: TextStyle(
          color: textDark,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        contentTextStyle: TextStyle(
          color: textDark,
          fontSize: 14,
        ),
      ),

      inputDecorationTheme: const InputDecorationTheme(
        filled: true,
        fillColor: onSurfaceDark,
        hintStyle: TextStyle(color: textDark),
        border: OutlineInputBorder(),
      ),

      textTheme: const TextTheme(
        bodyLarge: TextStyle(color: textDark, fontSize: 16),
        bodyMedium: TextStyle(color: textDark, fontSize: 14),
        titleLarge: TextStyle(
          color: textDark,
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