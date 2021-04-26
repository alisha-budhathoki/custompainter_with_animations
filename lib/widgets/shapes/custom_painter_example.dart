import 'dart:ui';
import 'package:flutter/material.dart';

import '../custom_painter_example_widgets.dart';

Animation<double> animation;
AnimationController controller;

class CustomPaintExample extends StatefulWidget {
  @override
  _CustomPaintExampleState createState() => _CustomPaintExampleState();
}

class _CustomPaintExampleState extends State<CustomPaintExample>
    with SingleTickerProviderStateMixin {
  // double percentValue = 0.0;
  // double newPercentage = 0.0;
  // AnimationController _percentValueAnimationController;
  // double _height;
  // double _width;

  @override
  void initState() {
    super.initState();
    setState(() {
      // percentValue = 0.0;
      controller = AnimationController(
          duration: const Duration(seconds: 8), vsync: this);
      animation = Tween<double>(begin: 0, end: 180).animate(controller)
        ..addListener(() {
          setState(() {
            if (animation.value == 180) {
              controller.reverse();
            } else if (animation.value == 0) {
              controller.forward();
            }
            // The state that has changed here is the animation object’s value.
          });
        });
      controller.forward();
    });
    // _percentValueAnimationController = new AnimationController(
    //     vsync: this, duration: new Duration(milliseconds: 1000))
    //   ..addListener(() {
    //     setState(() {
    //       percentValue = lerpDouble(percentValue, newPercentage,
    //           _percentValueAnimationController.value);
    //     });
    //   });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // _height = MediaQuery.of(context).size.height;
    // _width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.greenAccent[200],
        title: Text('Custom Painter Example'),
      ),
      body: Container(
        child: Stack(
          children: <Widget>[
            CustomPainterExampleWidgets.buildBottomCircle(),
            // InsideFace(),
            Positioned(
              top: 220,
              left: animation.value,
              child: Stack(
                children: <Widget>[
                  CustomPainterExampleWidgets.buildInsideRectangle(),
                ],
              ),
            ),
            CustomPainterExampleWidgets.buildShape(),

            Positioned(
              top: 200,
              left: animation.value,
              child: Stack(
                children: <Widget>[
                  CustomPainterExampleWidgets.semiCircle(),
                ],
              ),
            ),
            Positioned(
              top: 245,
              left: 50 + animation.value,
              child: Stack(
                children: <Widget>[
                  CustomPainterExampleWidgets.curve(),
                ],
              ),
            ),
            Positioned(
              top: 200,
              left: animation.value,
              child: Stack(
                children: <Widget>[
                  CustomPainterExampleWidgets.buildLeftEye(),
                ],
              ),
            ),
            Positioned(
              top: 200,
              left: animation.value,
              child: Stack(
                children: <Widget>[
                  CustomPainterExampleWidgets.buildRightEye(),
                ],
              ),
            ),
            Positioned(
              top: 200,
              left: animation.value,
              child: Stack(
                children: <Widget>[
                  CustomPainterExampleWidgets.buildMouth(),
                ],
              ),
            ),
            // CustomPainterExampleWidgets.semiCircle(),
            // CustomPainterExampleWidgets.curve(),
            // CustomPainterExampleWidgets.buildLeftEye(),
            // CustomPainterExampleWidgets.buildRightEye(),
            // CustomPainterExampleWidgets.buildMouth(),

            // CustomPainterExampleWidgets.buildButtonAnimation(
            //   height: _height / 2,
            //   width: _width / 2,
            //   percentValue: percentValue,
            //   onPress: () {
            //     setState(() {
            //       percentValue = newPercentage;
            //       newPercentage += 10;
            //       if (newPercentage > 100.0) {
            //         percentValue = 0.0;
            //         newPercentage = 0.0;
            //       }
            //       _percentValueAnimationController.forward(from: 0.0);
            //     });
            //   },
            // )
          ],
        ),
      ),
    );
  }
}
