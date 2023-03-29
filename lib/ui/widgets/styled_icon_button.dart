import 'package:flutter/material.dart';

class StyledIconButton extends StatelessWidget {
  final VoidCallback onPressed;
  final bool? disabled;
  final IconData icon;

  const StyledIconButton({
    Key? key,
    required this.onPressed,
    required this.icon,
    this.disabled,
  }) : super(key: key);

  // For some reason custom IconButtonTheme not working
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: IconButton(
        onPressed: disabled == true ? null : onPressed,
        icon: Icon(icon),
        iconSize: 27,
        splashRadius: 27 / 1.25,
      ),
    );
  }
}
