import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class NetworkCachedImage extends StatelessWidget {
  const NetworkCachedImage({
    super.key,
    required this.url,
    this.width,
    this.height,
    this.fit,
  });
  final String url;
  final String? width;
  final String? height;
  final BoxFit? fit;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: url,
      progressIndicatorBuilder: (context, url, progress) {
        return CircularProgressIndicator();
      },
      errorWidget: (context, url, error) {
        return Icon(Icons.error);
      },
    );
  }
}
