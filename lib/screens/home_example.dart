import 'package:flutter/material.dart';

import '../widgets/bottom_wave_container.dart';
import '../widgets/custom_painter_example_widgets.dart';

Animation<double> animation;
AnimationController controller;

class HomeScreenExample extends StatefulWidget {
  @override
  _HomeScreenExampleState createState() => _HomeScreenExampleState();
}

class _HomeScreenExampleState extends State<HomeScreenExample>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    setState(() {
      controller = AnimationController(
          duration: const Duration(seconds: 3), vsync: this);
      animation = Tween<double>(begin: 15, end: 160).animate(controller)
        ..addListener(() {
          setState(() {
            if (animation.value == 160) {
              controller.reverse();
            } else if (animation.value == 15) {
              controller.forward();
            }
          });
        });
      controller.forward();
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black87,
        title: Text('Custom Painter Example'),
      ),
      body: Container(
        child: Stack(
          children: <Widget>[
            HomePageExampleWidgets.buildBottomCircle(),
            Positioned(
              top: 322,
              left: 50 + animation.value,
              child: BottomWaveContainer(
                Container(
                  height: 45,
                  width: 100,
                  color: Colors.white,
                ),
              ),
            ),
            Positioned(
              top: 215,
              left: animation.value,
              child: Stack(
                children: <Widget>[
                  HomePageExampleWidgets.buildInsideRectangle(),
                ],
              ),
            ),
            Positioned(
              top: 190,
              left: animation.value,
              child: Stack(
                children: <Widget>[
                  HomePageExampleWidgets.semiCircle(),
                ],
              ),
            ),
            Positioned(
              top: 200,
              left: animation.value,
              child: Stack(
                children: <Widget>[
                  HomePageExampleWidgets.buildLeftEye(),
                ],
              ),
            ),
            Positioned(
              top: 200,
              left: animation.value,
              child: Stack(
                children: <Widget>[
                  HomePageExampleWidgets.buildRightEye(),
                ],
              ),
            ),
            Positioned(
              top: 200,
              left: animation.value,
              child: Stack(
                children: <Widget>[
                  HomePageExampleWidgets.buildMouth(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
