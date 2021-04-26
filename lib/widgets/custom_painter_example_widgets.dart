import 'package:custompainter_with_animations/widgets/shapes/custom_circle_class.dart';
import 'package:custompainter_with_animations/widgets/shapes/custom_semi_circle.dart';
import 'package:flutter/material.dart';

import 'shapes/custom_rectangle.dart';
import '../green_clipper.dart';
import 'shapes/curve_painter.dart';
import '../my_painter.dart';

class CustomPainterExampleWidgets {
  static Widget buildShape() {
    return ClipPath(
      clipper: CustomShapeClass(),
      child: Container(
        color: Colors.orange.withOpacity(0.7),
      ),
    );
  }

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
              radius: 10, color: Colors.black, widthVal: 90, heightVal: 60),
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
              radius: 10, color: Colors.black, widthVal: 120, heightVal: 60),
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
              radius: 5, color: Colors.black, widthVal: 110, heightVal: 87),
        ),
      ),
    );
  }

  static Widget semiCircle() {
    return Container(
      child: Center(
        child: CustomPaint(size: Size(200, 200), painter: CustomSemiCircle()),
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

  static Widget buildButtonAnimation(
      {@required double height,
      @required double width,
      @required double percentValue,
      @required Function onPress}) {
    return Center(
      child: Container(
        height: height,
        width: width,
        child: CustomPaint(
          foregroundPainter: ButtonPainter(
              buttonBorderColor: Colors.grey[300],
              progressColor: Colors.red,
              percentage: percentValue,
              width: 8.0),
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: RaisedButton(
                color: Colors.cyanAccent,
                splashColor: Colors.tealAccent,
                shape: CircleBorder(),
                child: Text(
                  "Press\n  ${percentValue.toInt()}%",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                onPressed: onPress),
          ),
        ),
      ),
    );
  }
}
