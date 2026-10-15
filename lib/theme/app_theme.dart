import 'package:flutter/material.dart';

// =====================================================
// APP THEME — all colors and styles for the whole app.
// We have TWO themes: dark (Home) and light (Login/Signup).
// =====================================================
class AppTheme {

  // -----------------------------------------
  // DARK THEME COLORS (Home, Welcome, AddPet)
  // -----------------------------------------
  static const Color black = Color(0xFF0B0C0E);
  static const Color surface = Color(0xFF17191C);
  static const Color teal = Color(0xFF2BB5A8);
  static const Color softText = Color(0xFFB8BCC2);
  static const Color mint = Color(0xFF1F2A28);
  static const Color bodyText = Color(0xFFFFFFFF);

  // -----------------------------------------
  // LIGHT THEME COLORS (Login, Signup)
  // Cream background + white cards + dark text.
  // -----------------------------------------
  static const Color lightBackground = Color(0xFFF7F4EF);
  static const Color lightSurface = Color(0xFFFFFFFF);
  static const Color darkText = Color(0xFF1A1D1F);
  static const Color greyText = Color(0xFF7A7E83);
  static const Color lightBorder = Color(0xFFE5E2DC);

  // -----------------------------------------
  // DARK THEME — used on Home and Welcome screens.
  // Brightness.dark makes text white automatically.
  // -----------------------------------------
  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      colorScheme: ColorScheme.fromSeed(
        seedColor: teal,
        brightness: Brightness.dark,
      ),
      scaffoldBackgroundColor: black,
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
    );
  }

  // -----------------------------------------
  // LIGHT THEME — used on Login and Signup screens.
  // Brightness.light makes text dark automatically.
  // -----------------------------------------
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      colorScheme: ColorScheme.fromSeed(
        seedColor: teal,
        brightness: Brightness.light,
      ),
      scaffoldBackgroundColor: lightBackground,
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
    );
  }
}