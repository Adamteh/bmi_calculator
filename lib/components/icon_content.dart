import 'package:flutter/material.dart';

import 'constants.dart';

class ReusableIconText extends StatelessWidget {
  ReusableIconText({this.icon, this.text});
  final icon;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          icon,
          size: 80,
        ),
        SizedBox(
          height: 15,
        ),
        Text(
          text,
          style: kTextStyle,
        )
      ],
    );
  }
}
