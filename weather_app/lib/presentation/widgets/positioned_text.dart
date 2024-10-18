import 'package:flutter/material.dart';

class PositionedText extends StatelessWidget {
  const PositionedText({
    super.key,
    required this.text,
    this.top = 0,
    this.bottom = 0,
    this.right = 0,
    this.left = 0,
    this.style,
  });
  final String text;
  final double top;
  final double bottom;
  final double right;
  final double left;
  final TextStyle? style; // Add this line

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: top,
      right: right,
      left: left,
      bottom: bottom,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            text,
            style: style ?? TextStyle(),
          )
        ],
      ),
    );
  }
}
