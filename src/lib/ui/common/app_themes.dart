import 'package:flutter/material.dart';

/* ColorSchemes */

abstract final class ColorSchemes {
  static ColorScheme get lightTheme => ColorScheme.fromSeed(
      seedColor: Colors.indigo, background: Colors.indigo.shade50);

  static ColorScheme get darkTheme => ColorScheme.fromSeed(
      seedColor: Colors.indigo.shade400, brightness: Brightness.dark);
}

/* AppBarThemes */

abstract final class AppBarThemes {
  static AppBarTheme get lightTheme => const AppBarTheme(
      elevation: 15,
      foregroundColor: Colors.white,
      backgroundColor: Colors.indigo);

  static AppBarTheme get darkTheme =>
      const AppBarTheme(elevation: 15, backgroundColor: Colors.indigo);
}

/* FloatingActionButtonTheme */

abstract final class FloatingActionButtonThemes {
  static FloatingActionButtonThemeData get lightTheme =>
      FloatingActionButtonThemeData(
          backgroundColor: Colors.indigo.shade600,
          foregroundColor: Colors.indigo.shade50);

  static FloatingActionButtonThemeData get darkTheme =>
      FloatingActionButtonThemeData(backgroundColor: Colors.indigo.shade400);
}

/* InputDecorationThemes */

abstract final class InputDecorationThemes {
  static InputDecorationTheme get lightTheme => InputDecorationTheme(
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(width: 2)),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(width: 2, color: Colors.black38)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: Colors.indigo.shade600, width: 2)),
      );

  static InputDecorationTheme get darkTheme => InputDecorationTheme(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(width: 2, color: Colors.white38)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(
              color: Colors.indigo,
              width: 2,
            )),
      );
}

/* SliderThemes */

abstract final class SliderThemes {
  static SliderThemeData get lightTheme => SliderThemeData(
      thumbColor: Colors.indigo.shade600, inactiveTrackColor: Colors.black26);

  static SliderThemeData get darkTheme => SliderThemeData(
      thumbColor: Colors.indigo.shade400,
      inactiveTrackColor: Colors.white60,
      activeTrackColor: Colors.indigo.shade400);
}

/* AppThemes */

abstract final class AppThemes {
  static ThemeData get lightTheme => ThemeData(
      colorScheme: ColorSchemes.lightTheme,
      appBarTheme: AppBarThemes.lightTheme,
      floatingActionButtonTheme: FloatingActionButtonThemes.lightTheme,
      inputDecorationTheme: InputDecorationThemes.lightTheme,
      sliderTheme: SliderThemes.lightTheme,
      useMaterial3: true);

  static ThemeData get darkTheme => ThemeData(
      colorScheme: ColorSchemes.darkTheme,
      appBarTheme: AppBarThemes.darkTheme,
      floatingActionButtonTheme: FloatingActionButtonThemes.darkTheme,
      inputDecorationTheme: InputDecorationThemes.darkTheme,
      sliderTheme: SliderThemes.darkTheme,
      useMaterial3: true);
}
