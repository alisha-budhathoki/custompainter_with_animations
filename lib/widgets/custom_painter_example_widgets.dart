import 'package:custompainter_with_animations/custom_circle_class.dart';
import 'package:flutter/material.dart';

import '../green_clipper.dart';
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
