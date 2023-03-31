import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class StyledIconButton extends StatelessWidget {
  final VoidCallback onPressed;
  final bool? disabled;
  final Color? bgColor;
  final dynamic icon;
  final double iconSize;
  final Color? iconColor;
  final BoxBorder? border;

  const StyledIconButton({
    super.key,
    required this.onPressed,
    required this.iconSize,
    this.disabled,
    this.bgColor,
    this.iconColor,
    this.border,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Ink(
      decoration: BoxDecoration(
        color: bgColor,
        shape: BoxShape.circle,
        border: border,
      ),
      child: IconButton(
        padding: EdgeInsets.zero,
        onPressed: disabled == true ? null : onPressed,
        icon: _buildIcon(),
        iconSize: iconSize,
      ),
    );
  }

  Widget _buildIcon() {
    if (icon is IconData) {
      return Icon(
        icon,
        color: iconColor,
        size: iconSize,
      );
    } else {
      return SvgPicture.asset(icon);
    }
  }
}
