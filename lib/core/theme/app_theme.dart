import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static ThemeData get lightTheme {
    final base = ThemeData.light();

    return base.copyWith(
      useMaterial3: true,
      scaffoldBackgroundColor: const Color(0xFFF9FAFB),
      textTheme: TextTheme(
        headlineLarge: TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.w700,
          letterSpacing: -0.5,
        ),
        titleMedium: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: const Color(0xFF656388),
        ),
        bodyMedium: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
      ),
      appBarTheme: const AppBarTheme(
        elevation: 0,
        backgroundColor: Color(0xFFF9FAFB),
        surfaceTintColor: Colors.transparent,
      ),
    );
  }
}
