import 'package:chat_mate/ui/utility/assets_paths.dart';
import 'package:flutter/material.dart';

class BackgroundWidgets extends StatelessWidget {
  const BackgroundWidgets({
    super.key,
    required this.child,
  });
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          AssetsPaths.backgroundImage,
          height: double.maxFinite,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
        child,
      ],
    );
  }
}
