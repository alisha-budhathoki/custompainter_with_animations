import 'package:flutter/material.dart';
import 'dart:math' as math;

// This is the Painter class
class CustomSemiCircle extends CustomPainter {
  final double widthVal;
  final double heightVal;
  final double radius;
  final Color color;

  const CustomSemiCircle(
      {this.widthVal,
      this.heightVal,
      this.radius = 100.0,
      this.color = Colors.teal});

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = Colors.white;
    canvas.drawArc(
      Rect.fromCenter(
        center: Offset(size.height / 2, size.width / 3),
        height: size.height / 2,
        width: size.width / 2,
      ),
      math.pi,
      math.pi,
      false,
      paint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
