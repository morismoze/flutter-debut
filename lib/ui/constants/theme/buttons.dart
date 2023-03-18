import 'package:flutter/material.dart';

abstract class ButtonsTheme {
  ButtonsTheme._();

  static ElevatedButtonThemeData getElevatedButtonTheme(
      ColorScheme colorScheme) {
    return ElevatedButtonThemeData(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.resolveWith(
                (states) => colorScheme.primary),
            textStyle: MaterialStateProperty.resolveWith((states) =>
                const TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
            foregroundColor:
                MaterialStateProperty.all<Color>(colorScheme.secondary),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30))),
            padding: MaterialStateProperty.all<EdgeInsets>(
                const EdgeInsets.symmetric(vertical: 20))));
  }
}
