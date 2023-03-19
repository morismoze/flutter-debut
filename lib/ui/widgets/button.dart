import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final Color? backgroundColor;
  final Color? textColor;
  final IconData? suffixIconData;
  final Color? iconColor;

  const Button(
      {Key? key,
      required this.onPressed,
      required this.text,
      this.backgroundColor,
      this.textColor,
      this.suffixIconData,
      this.iconColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          style: ElevatedButtonTheme.of(context).style,
          onPressed: onPressed,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Row(
              mainAxisAlignment: suffixIconData == null
                  ? MainAxisAlignment.center
                  : MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                if (suffixIconData != null) ...[
                  Text(text),
                  Icon(
                    suffixIconData,
                    size: 20,
                  )
                ] else ...[
                  Text(text),
                ]
              ],
            ),
          ),
        ));
  }
}
