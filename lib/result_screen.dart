// ignore_for_file: must_be_immutable

import 'package:bmi_app/reusuable_card.dart';
import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  ResultPage(
      {Key? key,
      required this.bmi,
      required this.resultText,
      required this.interpretation})
      : super(key: key);

  String bmi;
  String resultText;
  String interpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("BMI CALCULATOR"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          const Center(
            child: Padding(
              padding: EdgeInsets.only(top: 20),
              child: Text(
                "Your Result",
                style: TextStyle(fontSize: 35, fontWeight: FontWeight.w700),
              ),
            ),
          ),
          Expanded(
            flex: 10,
            child: Reuseable(
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      resultText,
                      style: const TextStyle(
                        color: Colors.green,
                        fontSize: 30,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    Text(
                      bmi,
                      style: const TextStyle(
                          fontSize: 50, fontWeight: FontWeight.w900),
                    ),
                    Text(
                      interpretation,
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 20),
                    )
                  ],
                ),
                colour: const Color(0XFF1D1E33)),
          ),
          Expanded(
            flex: 1,
            child: InkWell(
              onTap: () => Navigator.pop(context),
              child: Container(
                margin: const EdgeInsets.only(bottom: 5),
                color: Colors.green,
                child: const Center(
                    child: Text(
                  "RE-CALCULATE",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w400),
                )),
              ),
            ),
          )
        ],
      ),
    );
  }
}
