import 'package:flutter/material.dart';

class CurvePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint1 = Paint();

    var path = Path();

    path.moveTo(0, size.height / 1.15);
    var firstControlPoint = new Offset(size.width / 4, size.height * 1.2);
    var firstEndPoint = new Offset(size.width / 2.3, size.height / 1.1);
    var secondControlPoint =
        new Offset(size.width - (size.width / 3), size.height / 1.6);
    var secondEndPoint = new Offset(size.width, size.height / 1.15);

    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);
    path.lineTo(size.width, size.height / 1.11);
    paint1.color = Colors.green[800];
    paint1.style = PaintingStyle.fill;

    canvas.drawPath(path, paint1);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
