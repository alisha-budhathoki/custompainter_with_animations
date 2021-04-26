import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomRectangle extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // TODO: implement paint
    var paint = Paint()
      ..color = Colors.white
      ..strokeWidth = 15;

    final a = Offset(size.width * 2 / 8, size.height * 1 / 4);
    final b = Offset(size.width * 6 / 8, size.height * 3 / 4);
    final rect = Rect.fromPoints(a, b);

    canvas.drawRect(rect, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    // throw UnimplementedError();
    return false;
  }
}
