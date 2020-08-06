import 'package:flutter/material.dart';
import 'constants.dart';

class BottomBox extends StatelessWidget {
  final String buttonTitle;
  final Function onTap;
  BottomBox({this.buttonTitle, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          color: kbottomCardColor,
          margin: EdgeInsets.only(top: 10.0),
          width: double.infinity,
          height: kbottomContainer,
          padding: EdgeInsets.only(bottom: 20.0),
          child: Center(
            child: Text('$buttonTitle',
              style: TextStyle(
                  fontSize: 25.0
              ),),
          )
      ),
    );
  }
}
