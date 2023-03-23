import 'package:flutter/material.dart';

abstract class InputsTheme {
  InputsTheme._();

  static InputDecorationTheme getinputTheme(ColorScheme colorScheme) {
    return InputDecorationTheme(
        filled: false,
        prefixIconColor: colorScheme.tertiary.withOpacity(0.6),
        suffixIconColor: colorScheme.tertiary.withOpacity(0.6),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: colorScheme.primary, width: 1.0),
            borderRadius: BorderRadius.circular(40)),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: colorScheme.tertiary.withOpacity(0.4), width: 1.0),
            borderRadius: BorderRadius.circular(40)));
  }
}
