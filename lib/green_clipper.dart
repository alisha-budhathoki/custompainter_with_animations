import 'package:flutter/material.dart';

class CustomShapeClass extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    var path = new Path();
    path.lineTo(0, size.height / 1.15);
    var firstControlPoint = new Offset(size.width / 4, size.height * 1.1);
    var firstEndPoint = new Offset(size.width / 2.3, size.height / 1.1);
    var secondControlPoint =
        new Offset(size.width - (size.width / 3), size.height / 1.6);
    var secondEndPoint = new Offset(size.width, size.height / 1.15);

    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);

    path.lineTo(size.width, size.height / 5);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) {
    return true;
  }
}
