import 'package:custompainter_with_animations/widgets/shapes/custom_circle_class.dart';
import 'package:custompainter_with_animations/widgets/shapes/custom_curver_clipper.dart';
import 'package:custompainter_with_animations/widgets/shapes/custom_semi_circle.dart';
import 'package:flutter/material.dart';

import 'shapes/custom_rectangle.dart';
import 'shapes/curve_painter.dart';

class HomePageExampleWidgets {
  static Widget buildInsideRectangle() {
    return Container(
      child: Center(
        child: CustomPaint(
          size: Size(200, 150),
          painter: CustomRectangle(),
        ),
      ),
    );
  }

  static Widget buildBottomCircle() {
    return Container(
      child: Center(
        child: CustomPaint(
          size: Size(200, 200),
          painter: CustomCircle(),
        ),
      ),
    );
  }

  static Widget buildLeftEye() {
    return Container(
      child: Center(
        child: CustomPaint(
          size: Size(200, 200),
          painter: CustomCircle(
            radius: 10,
            color: Colors.black,
            widthVal: 90,
            heightVal: 60,
          ),
        ),
      ),
    );
  }

  static Widget buildRightEye() {
    return Container(
      child: Center(
        child: CustomPaint(
          size: Size(200, 200),
          painter: CustomCircle(
            radius: 10,
            color: Colors.black,
            widthVal: 120,
            heightVal: 60,
          ),
        ),
      ),
    );
  }

  static Widget buildMouth() {
    return Container(
      child: Center(
        child: CustomPaint(
          size: Size(200, 200),
          painter: CustomCircle(
            radius: 5,
            color: Colors.black,
            widthVal: 110,
            heightVal: 87,
          ),
        ),
      ),
    );
  }

  static Widget semiCircle() {
    return Container(
      child: Center(
        child: CustomPaint(
          size: Size(200, 200),
          painter: CustomSemiCircle(),
        ),
      ),
    );
  }

  static Widget curve() {
    return Container(
      child: Center(
        child: CustomPaint(size: Size(100, 100), painter: CurvePainter()),
      ),
    );
  }

  static Widget curve2() {
    return TweenAnimationBuilder(
      child: Container(
        height: 100,
        color: Colors.white,
      ),
      curve: Curves.elasticOut,
      tween: Tween(begin: -50.0, end: 0.0),
      duration: Duration(seconds: 2),
      builder: (context, value, child) {
        return ClipPath(
          child: child,
          clipper: BottomWaveClipper(value: value),
        );
      },
    );
  }
}
