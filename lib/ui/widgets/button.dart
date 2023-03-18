import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final Color? backgroundColor;
  final Color? textColor;
  final IconData? iconData;
  final Color? iconColor;

  const Button(
      {Key? key,
      required this.onPressed,
      required this.text,
      this.backgroundColor,
      this.textColor,
      this.iconData,
      this.iconColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          style: ElevatedButtonTheme.of(context).style,
          onPressed: onPressed,
          child: Row(
            mainAxisAlignment: iconData == null
                ? MainAxisAlignment.center
                : MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [Text(text)],
          ),
        ));
  }
}
