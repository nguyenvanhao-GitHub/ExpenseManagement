import 'package:flutter/material.dart';

class AppImage extends StatelessWidget {
  final String assets;
  final double width;
  final double height;
  final BoxFit? fit;

  const AppImage({
    super.key,
    required this.assets,
    required this.width,
    required this.height,
    required this.fit,
  });

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Image.asset(
      assets,
      width: width,
      height: height,
      fit: fit ?? BoxFit.contain,
    );
  }
}
