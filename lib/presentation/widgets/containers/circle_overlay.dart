import 'package:flutter/material.dart';

class OverlayCircleShape extends StatelessWidget {
  const OverlayCircleShape({
    super.key,
    required this.x,
    required this.y,
    required this.size,
    required this.opacity,
  });

  final double x;
  final double y;

  final double size;
  final double opacity;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: x,
      bottom: y,
      child: Container(
        height: size,
        width: size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white.withValues(alpha: opacity),
        ),
      ),
    );
  }
}
