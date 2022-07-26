// ignore_for_file: prefer_const_constructors

import 'package:bmi_app/calculator_brain.dart';
import 'package:bmi_app/icon_content.dart';
import 'package:bmi_app/result_screen.dart';
import 'package:bmi_app/reusuable_card.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  State<InputPage> createState() => _InputPageState();
}

enum Gender { male, female }

enum Calc { add, minus, weight, age }

class _InputPageState extends State<InputPage> {
  Color maleCardColour = const Color(0XFF1D1E33);
  Color femaleCardColour = const Color(0XFF1D1E33);
  Color colour = const Color(0xFF1D1E33);
  Color onselect = const Color(0XFF1D6E33);

  gencolorchanger(Gender gender) {
    if (gender == Gender.female) {
      if (femaleCardColour == const Color(0XFF1D1E33)) {
        femaleCardColour = onselect;
        maleCardColour = const Color(0XFF1D1E33);
      } else {
        femaleCardColour = const Color(0XFF1D1E33);
      }
    } else if (gender == Gender.male) {
      if (maleCardColour == const Color(0XFF1D1E33)) {
        maleCardColour = onselect;
        femaleCardColour = const Color(0XFF1D1E33);
      } else {
        maleCardColour = const Color(0XFF1D1E33);
      }
    }
  }

  Widget roundcontainer(icondata, Calc calc, Calc prop) {
    calculator() {
      if (calc == Calc.add && prop == Calc.weight) {
        setState(() {
          weight += 1;
        });
      } else if (calc == Calc.minus && prop == Calc.weight) {
        setState(() {
          weight -= 1;
        });
      }

      if (calc == Calc.add && prop == Calc.age) {
        setState(() {
          age += 1;
        });
      } else if (calc == Calc.minus && prop == Calc.age) {
        setState(() {
          age -= 1;
        });
      }
    }

    return RawMaterialButton(
      onPressed: () {
        setState(() {
          calculator();
        });
      },
      elevation: 50,
      fillColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      constraints: BoxConstraints.tightFor(width: 56, height: 56),
      child: Icon(
        icondata,
        color: Color(0XFF1D1E33),
      ),
    );
  }

  int height = 180;

  int weight = 60;
  int age = 30;

  @override
  Widget build(BuildContext context) {
    double length = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: const Text("BMI CALCULATOR"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: Reuseable(
                      cardChild: InkWell(
                        onTap: () {
                          debugPrint("Male");
                          setState(() {
                            // malecolourchanger();

                            gencolorchanger(Gender.male);
                          });
                        },
                        child: const IconContent(
                          yourIcon: FontAwesomeIcons.mars,
                          text: "MALE",
                        ),
                      ),
                      colour: maleCardColour),
                ),
                Expanded(
                  child: Reuseable(
                    cardChild: InkWell(
                      onTap: () => setState(() {
                        // femalecolourchanger();
                        gencolorchanger(Gender.female);
                      }),
                      child: const IconContent(
                        text: "FEMALE",
                        yourIcon: FontAwesomeIcons.venus,
                      ),
                    ),
                    colour: femaleCardColour,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Reuseable(
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: const Text(
                      "HEIGHT",
                    ),
                  ),
                  Row(
                    textBaseline: TextBaseline.alphabetic,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        height.toString(),
                        style: TextStyle(
                          fontSize: 80,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      Text("cm"),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                        thumbShape:
                            RoundSliderThumbShape(enabledThumbRadius: 15),
                        overlayShape:
                            RoundSliderOverlayShape(overlayRadius: 30),
                        thumbColor: Colors.white,
                        overlayColor: Color(0XFF1D6E33),
                        activeTrackColor: Colors.white),
                    child: Slider(
                      value: height.toDouble(),
                      onChanged: (double newheight) {
                        setState(() {
                          height = newheight.round();
                          // debugPrint(newheight.round().toString());
                        });
                      },
                      min: 120,
                      max: 220,
                      inactiveColor: Colors.grey,
                    ),
                  ),
                ],
              ),
              colour: colour,
            ),
          ),
          Expanded(
            flex: 2,
            child: Row(
              children: [
                Expanded(
                  child: Reuseable(
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("WEIGHT"),
                        Text(
                          weight.toString(),
                          style: TextStyle(
                            fontSize: 80,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            roundcontainer(Icons.add, Calc.add, Calc.weight),
                            roundcontainer(
                                Icons.remove, Calc.minus, Calc.weight),
                          ],
                        )
                      ],
                    ),
                    colour: colour,
                  ),
                ),
                Expanded(
                  child: Reuseable(
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("AGE"),
                        Text(
                          age.toString(),
                          style: TextStyle(
                            fontSize: 80,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            roundcontainer(Icons.add, Calc.add, Calc.age),
                            roundcontainer(Icons.remove, Calc.minus, Calc.age)
                          ],
                        )
                      ],
                    ),
                    colour: colour,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              color: const Color(0XFF1D6E33),
              height: 10,
              margin: const EdgeInsets.only(top: 10, bottom: 10),
              child: InkWell(
                  child: Center(
                    child: Text(
                      "CALCULATE",
                      style: TextStyle(color: Colors.white, fontSize: 30),
                    ),
                  ),
                  onTap: () {
                    setState(() {
                      CalculatorBrain calc =
                          CalculatorBrain(heightC: height, weightC: weight);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: ((context) => ResultPage(
                                bmi: calc.calculateBMI(),
                                resultText: calc.getResult(),
                                interpretation: calc.getInterpretations(),
                              )),
                        ),
                      );
                    });
                  }),
            ),
          )
        ],
      ),
    );
  }
}

// malecolourchanger() {
//   if (maleCardColour == Color(0XFF1D1E33)) {
//     maleCardColour = onselect;
//   } else {
//     maleCardColour = Color(0XFF1D1E33);
//   }

//   if (maleCardColour == onselect && femaleCardColour == onselect) {
//     femaleCardColour = Color(0XFF1D1E33);
//   }
// }

// femalecolourchanger() {
//   if (femaleCardColour == Color(0XFF1D1E33)) {
//     femaleCardColour = onselect;
//   } else {
//     femaleCardColour = Color(0XFF1D1E33);
//   }
//   if (femaleCardColour == onselect && maleCardColour == onselect) {
//     maleCardColour = Color(0XFF1D1E33);
//   }
// }
