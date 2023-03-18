import 'package:debutapp/ui/constants/theme/buttons.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppThemeData {
  AppThemeData._();

  static const Color _primaryColorLight = Colors.black;
  static const Color _secondaryColorLight = Colors.white;
  static const Color _errorLight = Color(0xFFB10023);

  static ThemeData lightThemeData = themeData(lightColorScheme);
  static ThemeData darkThemeData = themeData(darkColorScheme);

  static ThemeData themeData(ColorScheme colorScheme) {
    return ThemeData(
        colorScheme: colorScheme,
        textTheme: _textTheme,
        primaryColor: const Color(0xFF000000),
        appBarTheme: AppBarTheme(
          backgroundColor: colorScheme.background,
          elevation: 0,
          iconTheme: IconThemeData(color: colorScheme.primary),
        ),
        iconTheme: IconThemeData(color: colorScheme.onPrimary),
        scaffoldBackgroundColor: colorScheme.background,
        elevatedButtonTheme: ButtonsTheme.getElevatedButtonTheme(colorScheme));
  }

  // This is temporary solution for theme colors that are yet to be defined
  static const Color _toDo = Color(0xFF000000);

  static const ColorScheme lightColorScheme = ColorScheme(
    primary: _primaryColorLight,
    secondary: _secondaryColorLight,
    background: _secondaryColorLight,
    surface: _secondaryColorLight,
    onBackground: _primaryColorLight,
    error: _errorLight,
    onError: _toDo,
    onPrimary: _toDo,
    onSecondary: _toDo,
    onSurface: _toDo,
    brightness: Brightness.light,
  );

  static const ColorScheme darkColorScheme = ColorScheme(
    primary: _toDo,
    secondary: _toDo,
    background: _toDo,
    surface: _toDo,
    onBackground: _toDo,
    error: _toDo,
    onError: _toDo,
    onPrimary: _toDo,
    onSecondary: _toDo,
    onSurface: _toDo,
    brightness: Brightness.dark,
  );

  static const _regular = FontWeight.w400;
  static const _medium = FontWeight.w500;
  static const _semiBold = FontWeight.w600;
  static const _bold = FontWeight.w700;

  // Properties are placed from the largest to the smallest (top to bottom)
  static final TextTheme _textTheme = TextTheme(
    headlineSmall: GoogleFonts.montserrat(fontWeight: _medium, fontSize: 16.0),
    headlineMedium: GoogleFonts.montserrat(fontWeight: _bold, fontSize: 20.0),
    headlineLarge: GoogleFonts.montserrat(fontWeight: _bold, fontSize: 24.0),
    titleSmall: GoogleFonts.montserrat(fontWeight: _medium, fontSize: 14.0),
    titleMedium: GoogleFonts.montserrat(fontWeight: _medium, fontSize: 16.0),
    titleLarge: GoogleFonts.montserrat(fontWeight: _bold, fontSize: 16.0),
    bodySmall: GoogleFonts.montserrat(fontWeight: _semiBold, fontSize: 16.0),
    bodyMedium: GoogleFonts.montserrat(fontWeight: _regular, fontSize: 16.0),
    bodyLarge: GoogleFonts.montserrat(fontWeight: _regular, fontSize: 14.0),
    labelSmall: GoogleFonts.montserrat(fontWeight: _medium, fontSize: 12.0),
    labelLarge: GoogleFonts.montserrat(fontWeight: _semiBold, fontSize: 14.0),
  );
}
