import 'package:flutter/material.dart';
import './input_Page.dart';
void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Color(0xFF090C22),
        scaffoldBackgroundColor: Color(0xFF090C22),
        textTheme: TextTheme(bodyText2: TextStyle(color: Colors.white)),
        accentColor: Colors.purple
      ),
      home: InputPage(),
    );
  }
}

