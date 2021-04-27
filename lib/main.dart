import 'package:flutter/material.dart';

import 'screens/home_example.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(),
      home: HomeScreenExample(),
      debugShowCheckedModeBanner: false,
    );
  }
}
