import 'package:flutter/material.dart';
import 'InputPage.dart';

void main() {
  runApp(BmiCalc());
}

class BmiCalc extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme:
          ThemeData.dark().copyWith(scaffoldBackgroundColor: Color(0xFF091033)),
      home: InputPage(),
    );
  }
}
