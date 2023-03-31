import 'package:debutapp/constants/theme/buttons.dart';
import 'package:debutapp/constants/theme/inputs.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppThemeData {
  AppThemeData._();

  static const Color _primaryColorLight = Colors.black;
  static const Color _secondaryColorLight = Colors.white;
  static const Color _tertiaryColorLight = Color(0xFF8A8A8A);
  static const Color _errorLight = Color(0xFFB10023);

  static ThemeData lightThemeData = themeData(lightColorScheme);
  static ThemeData darkThemeData = themeData(darkColorScheme);

  static ThemeData themeData(ColorScheme colorScheme) {
    return ThemeData(
      colorScheme: colorScheme,
      textTheme: _textTheme,
      primaryColor: _primaryColorLight,
      appBarTheme: AppBarTheme(
        backgroundColor: colorScheme.background,
        elevation: 0,
        iconTheme: IconThemeData(color: colorScheme.primary),
      ),
      iconTheme: IconThemeData(color: colorScheme.onPrimary),
      scaffoldBackgroundColor: colorScheme.background,
      elevatedButtonTheme: ButtonsTheme.getElevatedButtonTheme(colorScheme),
      inputDecorationTheme: InputsTheme.getInputTheme(colorScheme),
      iconButtonTheme: ButtonsTheme.getIconButtonTheme(colorScheme),
    );
  }

  // This is temporary solution for theme colors that are yet to be defined
  static const Color _toDo = _primaryColorLight;

  static const ColorScheme lightColorScheme = ColorScheme(
    primary: _primaryColorLight,
    secondary: _secondaryColorLight,
    tertiary: _tertiaryColorLight,
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
    tertiary: _toDo,
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
    headlineSmall: GoogleFonts.montserrat(
      fontWeight: _medium,
      fontSize: 22.0,
      height: 1.4,
    ),
    headlineMedium:
        GoogleFonts.montserrat(fontWeight: _bold, fontSize: 24.0, height: 1.4),
    headlineLarge:
        GoogleFonts.montserrat(fontWeight: _bold, fontSize: 26.0, height: 1.4),
    displaySmall: GoogleFonts.montserrat(
      fontWeight: _medium,
      fontSize: 18.0,
      height: 1.4,
    ),
    displayMedium:
        GoogleFonts.montserrat(fontWeight: _bold, fontSize: 22.0, height: 1.4),
    displayLarge:
        GoogleFonts.montserrat(fontWeight: _bold, fontSize: 22.0, height: 1.4),
    titleSmall: GoogleFonts.montserrat(
      fontWeight: _medium,
      fontSize: 14.0,
      height: 1.4,
    ),
    titleMedium: GoogleFonts.montserrat(
      fontWeight: _medium,
      fontSize: 16.0,
      height: 1.4,
    ),
    titleLarge:
        GoogleFonts.montserrat(fontWeight: _bold, fontSize: 16.0, height: 1.4),
    bodySmall: GoogleFonts.montserrat(
      fontWeight: _regular,
      fontSize: 14.0,
      height: 1.4,
    ),
    bodyMedium: GoogleFonts.montserrat(
      fontWeight: _regular,
      fontSize: 14.0,
      height: 1.4,
    ),
    bodyLarge: GoogleFonts.montserrat(
      fontWeight: _medium,
      fontSize: 15.0,
      height: 1.7,
    ),
    labelSmall: GoogleFonts.montserrat(
      fontWeight: _medium,
      fontSize: 12.0,
      height: 1.4,
    ),
    labelLarge: GoogleFonts.montserrat(
      fontWeight: _semiBold,
      fontSize: 14.0,
      height: 1.4,
    ),
  );
}
