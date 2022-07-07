import 'package:bmi_calculator_flutter/screens/result_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/icon_content.dart';
import 'package:bmi_calculator_flutter/components/reuseable_card.dart';
import '../constants.dart';
import '../components/bottom_button.dart';
import 'package:bmi_calculator_flutter/components/round_icon_button.dart';
import 'package:bmi_calculator_flutter/calulator_brain.dart';

// ENUMS //to make code more meaningful //
enum Gender { Male, Female }

enum PressButton { Minus, Plus }

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);
  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender? selectedGender;
  int height = 180;
  int weight = 60;
  int age = 19;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Container(
        //width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 1,
              child: Row(
                children: [
                  Expanded(
                      child: ReusableCard(

                          // by using ternary operator
                          selectedGender == Gender.Male
                              ? kActiveCardColor
                              : kInactiveCardColor,
                          IconContent(FontAwesomeIcons.mars, 'MALE'), () {
                    setState(() {
                      selectedGender = Gender.Male;
                    });
                  })),
                  Expanded(
                    child: ReusableCard(
                        // by using ternary operator
                        selectedGender == Gender.Female
                            ? kActiveCardColor
                            : kInactiveCardColor,
                        IconContent(FontAwesomeIcons.venus, 'FEMALE'), () {
                      setState(() {
                        selectedGender = Gender.Female;
                      });
                    }),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: ReusableCard(
                  kActiveCardColor,
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "HEIGHT",
                        style: kLableTextStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text(
                            height.toString(),
                            style: kNumberTextStyle,
                          ),
                          Text(
                            'cm',
                            style: kLableTextStyle,
                          ),
                        ],
                      ),
                      SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                          activeTrackColor: Colors.white,
                          inactiveTrackColor: Color(0xFF8D8E98),
                          thumbColor: Color(0xFFEB1555),
                          overlayColor: Color(0x29EB1555),
                          thumbShape:
                              RoundSliderThumbShape(enabledThumbRadius: 15.0),
                          overlayShape:
                              RoundSliderOverlayShape(overlayRadius: 30.0),
                        ),
                        child: Slider(
                          value: height.toDouble(),
                          min: 120.0,
                          max: 220.0,
                          onChanged: (double newValue) {
                            setState(() {
                              height = newValue.round();
                            });
                          },
                        ),
                      )
                    ],
                  ),
                  () {}),
            ),
            Expanded(
              flex: 1,
              child: Row(
                children: [
                  Expanded(
                    child: ReusableCard(
                        kActiveCardColor,
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "WEIGHT",
                              style: kLableTextStyle,
                            ),
                            Text(
                              weight.toString(),
                              style: kNumberTextStyle,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                RoundIconButton(FontAwesomeIcons.minus, () {
                                  setState(() {
                                    weight--;
                                  });
                                }),
                                SizedBox(
                                  width: 10,
                                ),
                                RoundIconButton(FontAwesomeIcons.plus, () {
                                  setState(() {
                                    weight++;
                                  });
                                }),
                              ],
                            ),
                          ],
                        ),
                        () {}),
                  ),
                  Expanded(
                    child: ReusableCard(
                        kActiveCardColor,
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "AGE",
                              style: kLableTextStyle,
                            ),
                            Text(
                              age.toString(),
                              style: kNumberTextStyle,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                RoundIconButton(FontAwesomeIcons.minus, () {
                                  setState(() {
                                    age--;
                                  });
                                }),
                                SizedBox(
                                  width: 10,
                                ),
                                RoundIconButton(FontAwesomeIcons.plus, () {
                                  setState(() {
                                    age++;
                                  });
                                }),
                              ],
                            ),
                          ],
                        ),
                        () {}),
                  ),
                ],
              ),
            ),
            BottomButton(() {
              CalculatorBrain calc = CalculatorBrain(height, weight);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultPage(
                    calc.CalculateBMI(),
                    calc.getResult(),
                    calc.getInterpretation(),
                  ),
                ),
              );
            }, 'CALCULATE')
          ],
        ),
      ),
    );
  }
}
