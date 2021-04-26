import 'package:flutter/material.dart';

import 'widgets/custom_painter_example_widgets.dart';

class InsideFace extends StatelessWidget {
  const InsideFace({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          children: [
            CustomPainterExampleWidgets.buildInsideRectangle(),
            CustomPainterExampleWidgets.semiCircle(),
            CustomPainterExampleWidgets.curve(),
            CustomPainterExampleWidgets.buildLeftEye(),
            CustomPainterExampleWidgets.buildRightEye(),
            CustomPainterExampleWidgets.buildMouth(),
          ],
        ),
      ),
      // child: child,
    );
  }
}
