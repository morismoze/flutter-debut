import 'package:flutter/material.dart';

class HorizontalOrLine extends StatelessWidget {
  final String label;
  final double? height;

  const HorizontalOrLine({
    super.key,
    required this.label,
    this.height = 0.5,
  });

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Expanded(
          child: Divider(
              color: const Color(0xFF797979), height: height, endIndent: 12)),
      Text(label,
          style: const TextStyle(fontSize: 14, color: Color(0xFF797979))),
      Expanded(
          child: Divider(
              color: const Color(0xFF797979), height: height, indent: 12)),
    ]);
  }
}
