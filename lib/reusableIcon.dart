import 'package:flutter/material.dart';
import 'constants.dart';

class ReusableIcon extends StatelessWidget {
  final IconData icon;
  final String label;
  ReusableIcon({this.icon, this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          icon,
          size: kiconSize,
          color: Colors.white,
        ),
        SizedBox(
          height: ksizeBoxHeight,
        ),
        Text('$label', style: klabelTextStyle,)
      ],
    );
  }
}