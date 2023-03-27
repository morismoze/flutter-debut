import 'package:flutter/material.dart';

class StyledButton extends StatelessWidget {
  final VoidCallback onPressed;
  final bool? disabled;
  final String text;
  final Color? backgroundColor;
  final Color? textColor;
  final IconData? suffixIconData;
  final IconData? prefixIconData;

  const StyledButton(
      {Key? key,
      required this.onPressed,
      required this.text,
      this.disabled,
      this.backgroundColor,
      this.textColor,
      this.suffixIconData,
      this.prefixIconData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isOnlySuffixIcon = prefixIconData == null && suffixIconData != null;

    return SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          style: ElevatedButtonTheme.of(context).style,
          onPressed: disabled == true ? null : onPressed,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                if (prefixIconData != null) ...[
                  Icon(
                    prefixIconData,
                    size: 20,
                  )
                ],
                Expanded(
                    child: isOnlySuffixIcon
                        ? Text(text)
                        : Center(child: Text(text))),
                if (suffixIconData != null) ...[
                  Icon(
                    suffixIconData,
                    size: 20,
                  )
                ],
              ],
            ),
          ),
        ));
  }
}
