import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:touchable/touchable.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyCoolPage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: CustomPaint(
          size: Size(200, 200),
          painter: LinePainter(),
        ),
      ),
    );
  }
}

class LinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Colors.teal
      ..strokeWidth = 15;

    Offset center = Offset(size.width / 2, size.height / 2);
    canvas.drawCircle(center, 100, paint);
    // Offset start = Offset(0, size.height / 2);
    // Offset end = Offset(size.width, size.height / 2);

    // canvas.drawLine(start, end, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

class MyCoolPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(child: MyWidget());
  }
}

class PaintingController extends ChangeNotifier {
  Offset circlePosition;
  Color backgroundColor = Colors.white;

  void moveCircle(Offset newPosition) {
    circlePosition = newPosition;
    notifyListeners();
  }

  void toggleBackGroundColor() {
    backgroundColor =
        backgroundColor == Colors.white ? Colors.blueGrey : Colors.white;
    notifyListeners();
  }
}

class MyWidget extends StatelessWidget {
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<PaintingController>(
      create: (context) => PaintingController(),
      child: Consumer<PaintingController>(
        builder: (context, controller, child) => AnimatedContainer(
          color: controller.backgroundColor,
          duration: Duration(seconds: 1),
          child: CanvasTouchDetector(
            builder: (context) => CustomPaint(painter: MyPainter(context)),
          ),
        ),
      ),
    );
  }
}

class MyPainter extends CustomPainter {
  final BuildContext context;
  final PaintingController controller;

  MyPainter(this.context)
      : controller = Provider.of<PaintingController>(context, listen: false);

  @override
  void paint(Canvas canvas, Size size) {
    TouchyCanvas touchyCanvas = TouchyCanvas(context, canvas);
    drawEarth(touchyCanvas, size);
    drawSun(touchyCanvas, size);
  }

  void drawEarth(TouchyCanvas canvas, Size size) {
    var blueCircleCenter = controller.circlePosition ??
        Offset(size.width / 2, size.height / 2 - 100);

    canvas.drawCircle(blueCircleCenter, 60, Paint()..color = Colors.lightGreen,
        onPanUpdate: (details) {
      controller.moveCircle(Offset(blueCircleCenter.dx + details.delta.dx * 2,
          blueCircleCenter.dy + details.delta.dy * 2));
    });
    canvas.drawCircle(
        blueCircleCenter, 30, Paint()..color = Colors.lightBlueAccent,
        hitTestBehavior: HitTestBehavior.translucent);
  }

  void drawSun(TouchyCanvas canvas, Size size) {
    var orangeCircleCenter = Offset(size.width / 2, size.height / 2 + 100);
    canvas.drawCircle(
        orangeCircleCenter, 80, Paint()..color = Colors.orangeAccent,
        onTapDown: (_) {
      controller.toggleBackGroundColor();
    });
    canvas.drawCircle(orangeCircleCenter, 50, Paint()..color = Colors.orange,
        hitTestBehavior: HitTestBehavior.translucent);
    canvas.drawCircle(
        orangeCircleCenter, 30, Paint()..color = Colors.deepOrangeAccent,
        hitTestBehavior: HitTestBehavior.translucent);
    canvas.drawCircle(
        orangeCircleCenter, 20, Paint()..color = Colors.deepOrange,
        hitTestBehavior: HitTestBehavior.translucent);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
