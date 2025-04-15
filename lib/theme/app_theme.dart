import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static const Color darkPlum = Color(0xFF140919);
  static const Color blackGrape = Color(0xFF050205);
  static const Color deepViolet = Color(0xFF23162E);
  static const Color grapeMist = Color(0xFF2E2B4D);
  static const Color purpleRose = Color(0xFF4E325C);
  static const Color lightLavender = Color(0xFFE5D4FF);

  static ThemeData lightTheme = ThemeData(
    primaryColor: const Color(0xFF2E2B4D),
    scaffoldBackgroundColor: const Color(0xFFF5F5F5),
    colorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFF2E2B4D),
      primary: const Color(0xFF2E2B4D),
      secondary: Colors.green[700]!,
    ),
    textTheme: GoogleFonts.poppinsTextTheme(),
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFF2E2B4D),
      elevation: 0,
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
    cardTheme: CardTheme(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      selectedItemColor: Color(0xFF2E2B4D),
      unselectedItemColor: Colors.grey,
    ),
  );

  static ThemeData darkTheme = ThemeData(
    primaryColor: const Color(0xFF2E2B4D),
    scaffoldBackgroundColor: const Color(0xFF121212),
    colorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFF2E2B4D),
      primary: const Color(0xFF2E2B4D),
      secondary: Colors.green[700]!,
      brightness: Brightness.dark,
    ),
    textTheme: GoogleFonts.poppinsTextTheme(ThemeData.dark().textTheme),
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFF2E2B4D),
      elevation: 0,
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
    cardTheme: CardTheme(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      selectedItemColor: Color(0xFF2E2B4D),
      unselectedItemColor: Colors.grey,
    ),
  );
} 