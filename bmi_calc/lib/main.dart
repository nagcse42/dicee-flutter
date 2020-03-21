import 'package:bmi_calc/screens/input_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(BMICalc());
}

class BMICalc extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xFF0A0E21),
        scaffoldBackgroundColor: Color(0xFF0A0E21),
      ),
      home: InputPage(),
    );
  }
}

