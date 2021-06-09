import 'package:flutter/material.dart';


class ReusableCard extends StatelessWidget {
ReusableCard({this.color, this.cardChild, this.cardTapped, this.flex});
  final Color color;
  final Widget cardChild;
  final Function cardTapped;
  final int flex;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex ?? 1,
      child: GestureDetector(
        onTap: cardTapped,
        child: Container(
          child: cardChild,
          margin: EdgeInsets.all(15.0),
          decoration: BoxDecoration(
              color: color, borderRadius: BorderRadius.circular(10.0)),
        ),
      ),
    );
  }
}

