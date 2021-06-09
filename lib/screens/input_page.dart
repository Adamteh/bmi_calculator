import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../components/reusable_card.dart';
import '../components/icon_content.dart';
import '../components/constants.dart';
import 'results_page.dart';
import '../components/bottom_button.dart';
import '../components/round_icon_button.dart';

import '../calculator_brain.dart';

enum Gender { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender _gender;
  int _height = 180;
  int _weight = 60;
  int _age = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                ReusableCard(
                    cardTapped: () {
                      setState(() {
                        _gender = Gender.male;
                      });
                    },
                    color: _gender == Gender.male
                        ? kActiveCardColor
                        : kInactiveCardColor,
                    cardChild: ReusableIconText(
                        icon: FontAwesomeIcons.mars, text: 'MALE')),
                ReusableCard(
                    cardTapped: () {
                      setState(() {
                        _gender = Gender.female;
                      });
                    },
                    color: _gender == Gender.female
                        ? kActiveCardColor
                        : kInactiveCardColor,
                    cardChild: ReusableIconText(
                        icon: FontAwesomeIcons.venus, text: 'FEMALE'))
              ],
            ),
          ),
          ReusableCard(
            color: kActiveCardColor,
            cardChild: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'HEIGHT',
                  style: kTextStyle,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: <Widget>[
                    Text(
                      _height.toString(),
                      style: kNumberTextStyle,
                    ),
                    Text(
                      'cm',
                      style: kTextStyle,
                    )
                  ],
                ),
                SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                      activeTrackColor: Colors.white,
                      thumbColor: Color(0xFFEB1555),
                      overlayColor: Color(0x1fEB1555),
                      thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15),
                      overlayShape: RoundSliderOverlayShape(overlayRadius: 30)),
                  child: Slider(
                      value: _height.toDouble(),
                      min: 120.0,
                      max: 220.0,
                      inactiveColor: Color(0xFF8D8E98),
                      onChanged: (double newValue) {
                        setState(() {
                          _height = newValue.round();
                        });
                      }),
                )
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                ReusableCard(
                  color: kActiveCardColor,
                  cardChild: ReusablePlusMinus(
                    text: 'WEIGHT',
                    value: _weight.toString(),
                    minus: () {
                      setState(() {
                        _weight--;
                      });
                    },
                    plus: () {
                      setState(() {
                        _weight++;
                      });
                    },
                  ),
                ),
                ReusableCard(
                  color: kActiveCardColor,
                  cardChild: ReusablePlusMinus(
                    text: 'AGE',
                    value: _age.toString(),
                    minus: () {
                      setState(() {
                        _age--;
                      });
                    },
                    plus: () {
                      setState(() {
                        _age++;
                      });
                    },
                  ),
                )
              ],
            ),
          ),
          BottomButton(
              buttonTitle: 'CALCULATE',
              onTap: () {
                CalculatorBrain calc =
                    CalculatorBrain(height: _height, weight: _weight);

                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => ResultsPage(bmiResult: calc.calculatebmi(), resultText: calc.getResult(), interpretation: calc.getInterpretation(),)));
              })
        ],
      ),
    );
  }
}

class ReusablePlusMinus extends StatelessWidget {
  ReusablePlusMinus({this.text, this.value, this.minus, this.plus});
  final String text;
  final String value;
  final Function minus;
  final Function plus;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          text,
          style: kTextStyle,
        ),
        Text(
          value,
          style: kNumberTextStyle,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RoundIconButton(
              icon: FontAwesomeIcons.minus,
              onPressed: minus,
            ),
            SizedBox(
              width: 15,
            ),
            RoundIconButton(
              icon: FontAwesomeIcons.plus,
              onPressed: plus,
            ),
          ],
        )
      ],
    );
  }
}
