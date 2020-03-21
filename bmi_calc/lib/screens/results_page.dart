import 'package:bmi_calc/components/bottom_button.dart';
import 'package:bmi_calc/components/reusable_card.dart';
import 'package:bmi_calc/constants.dart';
import 'package:flutter/material.dart';

import 'input_page.dart';

class ResultsPage extends StatelessWidget {
  final String bmiResult;
  final String bmiScore;
  final String bmiInterPretation;

  ResultsPage({this.bmiResult,  this.bmiScore,  this.bmiInterPretation});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Container(
              padding: EdgeInsets.all(15.0),
              alignment: Alignment.bottomLeft,
              child: Text(
                'Your Result',
                style: kTitleTxtStyle,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReusableCard(
              colour: kActiveCardColor,
              childCard: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    bmiResult,
                    style: kResultTxtStyle,
                  ),
                  Text(
                    bmiScore,
                    style: kBMIScoreStyle,
                  ),
                  Text(
                     bmiInterPretation,
                    textAlign: TextAlign.center,
                    style: kBMIBodytyle,
                  ),
                ],
              ),
            ),
          ),
          BottomButton(title: 'RE-CALCULATE',
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => InputPage()));
          },),
        ],
      ),
    );
  }
}
