import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // Dark Palette Tokens
  static const Color background = Color(0xFF0F172A); // Slate 900
  static const Color surface = Color(0xFF1E293B);    // Slate 800
  static const Color surfaceLight = Color(0xFF334155); // Slate 700
  static const Color primary = Color(0xFF38BDF8);    // Sky 400
  static const Color secondary = Color(0xFF818CF8);  // Indigo 400
  static const Color textPrimary = Color(0xFFF8FAFC); // Slate 50
  static const Color textMuted = Color(0xFF94A3B8);   // Slate 400
  static const Color codeBackground = Color(0xFF0B0F19); // Deep Charcoal

  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      scaffoldBackgroundColor: background,
      colorScheme: const ColorScheme.dark(
        primary: primary,
        secondary: secondary,
        surface: surface,
        onSurface: textPrimary,
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: background,
        elevation: 0,
        centerTitle: false,
        iconTheme: const IconThemeData(color: textPrimary),
        titleTextStyle: GoogleFonts.inter(
          color: textPrimary,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      cardTheme: CardThemeData(
        color: surface,
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: const BorderSide(color: Color(0xFF334155), width: 0.5),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: surface,
        hintStyle: GoogleFonts.inter(color: textMuted, fontSize: 14),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      ),
      textTheme: TextTheme(
        headlineMedium: GoogleFonts.inter(color: textPrimary, fontSize: 24, fontWeight: FontWeight.bold),
        titleLarge: GoogleFonts.inter(color: textPrimary, fontSize: 18, fontWeight: FontWeight.w600),
        titleMedium: GoogleFonts.inter(color: textPrimary, fontSize: 16, fontWeight: FontWeight.w500),
        bodyLarge: GoogleFonts.inter(color: textPrimary, fontSize: 15),
        bodyMedium: GoogleFonts.inter(color: textMuted, fontSize: 13),
      ),
    );
  }
}
