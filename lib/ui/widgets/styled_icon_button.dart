import 'package:flutter/material.dart';

class StyledIconButton extends StatelessWidget {
  final VoidCallback onPressed;
  final bool? disabled;
  final IconData icon;
  final Color? bgColor;
  final Color? iconColor;
  final double? iconSize;
  final BoxBorder? border;

  const StyledIconButton({
    Key? key,
    required this.onPressed,
    required this.icon,
    this.disabled,
    this.bgColor,
    this.iconColor,
    this.iconSize,
    this.border,
  }) : super(key: key);

  // For some reason custom IconButtonTheme not working
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        width: 50.0,
        height: 50.0,
        decoration: BoxDecoration(
          color: bgColor,
          shape: BoxShape.circle,
          border: border,
        ),
        child: Center(
          child: IconButton(
            onPressed: disabled == true ? null : onPressed,
            icon: Icon(
              icon,
              color: iconColor,
              size: iconSize,
            ),
            iconSize: 27,
            splashRadius: 27 / 1.25,
          ),
        ),
      ),
    );
  }
}
