import 'package:flutter/material.dart';

import 'custom_painter_example.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(),
      home: CustomPaintExample(),
      debugShowCheckedModeBanner: false,
    );
  }
}
