import 'package:flutter/material.dart';

import '../components/constants.dart';
import '../components/reusable_card.dart';
import '../components/bottom_button.dart';

class ResultsPage extends StatelessWidget {
  ResultsPage({this.bmiResult, this.resultText, this.interpretation});
  final String bmiResult;
  final String resultText;
  final String interpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Container(
              padding: EdgeInsets.all(15),
              alignment: Alignment.bottomLeft,
              child: Text(
                'Your Results',
                style: kTitleTextStyle,
              ),
            ),
          ),
          ReusableCard(
            flex: 5,
            color: kActiveCardColor,
            cardChild: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(resultText.toUpperCase(), style: kresultTextStyle),
                Text(bmiResult, style: kBMITextStyle),
                Text(interpretation,
                    style: kBodyTextStyle, textAlign: TextAlign.center)
              ],
            ),
          ),
          BottomButton(
            buttonTitle: 'RE-CALCULATE',
            onTap: () => Navigator.pop(context),
          )
        ],
      ),
    );
  }
}
