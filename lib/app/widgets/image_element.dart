import 'dart:io';

import 'package:flutter/material.dart';

class ImageElement extends StatelessWidget {
  const ImageElement(
      {required this.imagePath,
      this.width,
      this.height,
      this.borderSide,
      this.radius = 10});
  final String imagePath;
  final double? width;
  final double? height;
  final double radius;
  final BorderSide? borderSide;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius),
            side: borderSide == null ? BorderSide.none : borderSide!),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(radius),
          child: AspectRatio(
            aspectRatio: 1,
            child: Hero(
              tag: imagePath,
              child: Image.file(
                File(imagePath),
                fit: BoxFit.fill,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
