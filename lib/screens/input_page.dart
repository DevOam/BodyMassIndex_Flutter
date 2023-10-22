import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../calculator.dart';
import '../constants.dart';
import '../widgets/bottom_button.dart';
import '../widgets/icon_content.dart';
import '../widgets/card.dart';
import '../widgets/round_icon_button.dart';
import 'result_page.dart';

enum Gender {
  male,
  female,
  unselected,
}

class InputPage extends StatefulWidget {
  const InputPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender = Gender.unselected;
  int height = 180;
  int weight = 60;
  int age = 19;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(children: [
              Expanded(
                child: ReusableCard(
                  onPress: () {
                    setState(() {
                      selectedGender = Gender.male;
                    });
                  },
                  color: selectedGender == Gender.male
                      ? kActiveCardColor
                      : kInactiveCardColor,
                  cardChild: const IconContent(
                      icon: FontAwesomeIcons.mars, lable: 'MALE'),
                ),
              ),
              Expanded(
                child: ReusableCard(
                  onPress: () {
                    setState(() {
                      selectedGender = Gender.female;
                    });
                  },
                  cardChild: const IconContent(
                      icon: FontAwesomeIcons.venus, lable: 'FEMAL'),
                  color: selectedGender == Gender.female
                      ? kActiveCardColor
                      : kInactiveCardColor,
                ),
              )
            ]),
          ),
          Expanded(
            child: ReusableCard(
              color: kActiveCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "HEIGTH",
                    style: kLabelTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    textBaseline: TextBaseline.alphabetic,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    children: [
                      Text(
                        height.toString(),
                        style: kNumberTextStyle,
                      ),
                      const Text(
                        "cm",
                        style: kLabelTextStyle,
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      activeTrackColor: Colors.white,
                      inactiveTrackColor: const Color(0xff8d8e98),
                      overlayColor: const Color(0x29eb1555),
                      thumbColor: const Color(0xffeb1555),
                      thumbShape: const RoundSliderThumbShape(
                        enabledThumbRadius: 15,
                      ),
                      overlayShape: const RoundSliderOverlayShape(
                        overlayRadius: 30,
                      ),
                    ),
                    child: Slider(
                      value: height.toDouble(),
                      min: 120,
                      max: 220,
                      onChanged: (double newHeight) {
                        setState(
                          () {
                            height = newHeight.toInt().round();
                          },
                        );
                      },
                    ),
                  )
                ],
              ),
              onPress: null,
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "WEIGHT",
                          style: kLabelTextStyle,
                        ),
                        Text(
                          weight.toString(),
                          style: kNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPress: () => setState(() {
                                if (weight >= 1) weight--;
                              }),
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPress: () => setState(() {
                                weight++;
                              }),
                            ),
                          ],
                        ),
                      ],
                    ),
                    onPress: null,
                    color: kActiveCardColor,
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "AGE",
                          style: kLabelTextStyle,
                        ),
                        Text(
                          age.toString(),
                          style: kNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPress: () => setState(() {
                                if (age >= 1) age--;
                              }),
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPress: () => setState(() {
                                age++;
                              }),
                            ),
                          ],
                        ),
                      ],
                    ),
                    onPress: null,
                    color: kActiveCardColor,
                  ),
                ),
              ],
            ),
          ),
          ButtomButton(
            onPress: () {
              Calculator bmiCalculator = Calculator(
                height: height,
                weight: weight,
              );

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultPage(
                    bmiResult: bmiCalculator.calculateBMI(),
                    resultText: bmiCalculator.getBMIMessage(),
                    idealWeight: bmiCalculator.idealWeight(),
                    interpretation: bmiCalculator.getInterception(),
                  ),
                ),
              );
            },
            buttonText: "CALCULATE",
          )
        ],
      ),
    );
  }
}
