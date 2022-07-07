import 'package:bmi_calculator_flutter/screens/result_page.dart';
import 'package:flutter/material.dart';
import 'screens/input_page.dart';
import 'calulator_brain.dart';

void main() {
  runApp(const BMICalculator());
}

class BMICalculator extends StatelessWidget {
  const BMICalculator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // =====Creating own Theme====
      theme: ThemeData.dark().copyWith(
        colorScheme: ColorScheme.light(
          primary: Color(0xff0a0e21),
        ),
        // textTheme: const TextTheme(
        //   bodyText2: TextStyle(color: Colors.white),
        // ),
        scaffoldBackgroundColor: Color(0xff0a0e21),
      ),
      home: InputPage(),
    );
  }
}
