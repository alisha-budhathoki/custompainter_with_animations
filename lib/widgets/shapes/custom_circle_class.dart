import 'package:flutter/material.dart';

class CustomCircle extends CustomPainter {
  final double widthVal;
  final double heightVal;
  final double radius;
  final Color color;

  const CustomCircle({
    this.widthVal,
    this.heightVal,
    this.radius = 150.0,
    this.color = Colors.black87,
  });

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = color
      ..strokeWidth = 15;
    Offset center = Offset(widthVal == null ? size.width / 2 : widthVal,
        heightVal == null ? size.height / 2 : heightVal);
    canvas.drawCircle(center, radius, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
