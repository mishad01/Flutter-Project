import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:task_manager/ui/utility/assets.path.dart';

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
        SvgPicture.asset(AssetPaths.backgroundSvg),
        SvgPicture.asset(AssetPaths.backgroundSvg),
        child
      ],
    );
  }
}
