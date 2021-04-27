import 'package:custompainter_with_animations/widgets/shapes/custom_curver_clipper.dart';
import 'package:custompainter_with_animations/screens/home_example.dart';
import 'package:flutter/cupertino.dart';

Animation<double> animation;

AnimationController controller;

class BottomWaveContainer extends StatefulWidget {
  final Widget child;

  BottomWaveContainer(this.child);

  @override
  _BottomWaveContainerState createState() => _BottomWaveContainerState();
}

class _BottomWaveContainerState extends State<BottomWaveContainer>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    setState(
      () {
        controller = AnimationController(
            duration: const Duration(seconds: 1), vsync: this);
        animation = Tween<double>(begin: -50, end: 10).animate(controller)
          ..addListener(
            () {
              setState(
                () {
                  if (animation.value == 10) {
                    controller.reverse();
                  } else if (animation.value == -50) {
                    controller.forward();
                  }
                },
              );
            },
          );
        controller.forward();
      },
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      child: widget.child,
      clipper: BottomWaveClipper(value: animation.value),
    );
  }
}
