import 'package:flutter/material.dart';

class CustomImageCard extends StatelessWidget {
  final double width;
  final double height;
  final double borderRadius;
  final Color? bgColor;
  final String imagePath;
  final BoxFit fit;

  const CustomImageCard({
    super.key,
    required this.imagePath,
    this.width = 100,
    this.height = 100,
    this.borderRadius = 8,
    this.bgColor,
    this.fit = BoxFit.cover,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: Container(
        width: width,
        height: height,
        color: bgColor ?? Colors.grey[200],
        child: Image.asset(
          imagePath,
          fit: fit,
        ),
      ),
    );
  }
}
