import 'package:easy_msg/ui/utility/asset_path.dart';
import 'package:flutter/material.dart';

class BackGroundWidgets extends StatelessWidget {
  const BackGroundWidgets({
    super.key,
    required this.child,
  });
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          AssetPath.backgroundImg,
          height: double.infinity,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
        child
      ],
    );
  }
}
