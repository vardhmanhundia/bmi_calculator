import 'package:flutter/material.dart';
import './reusable_Card.dart';
import 'constants.dart';
import 'bottomButton.dart';
import 'calculateBrain.dart';

class ResultsPage extends StatelessWidget {

  final CalculateBrain result;
  ResultsPage({this.result});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Result',
        style: TextStyle(
          fontSize: 30.0
        ),),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: ReusableCard(
              colour: kactiveCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    result.getResult(),
                    style: klabelTextStyle.copyWith(
                      color: result.getResult() =='Normal'? Colors.green: Colors.red
                    ),
                  ),
                  Text(
                    result.getBMI(),
                    style: kConstantStyle.copyWith(fontSize: 100.0)
                  ),
                  Center(
                    child: Text(
                      result.getInterpretation(),
                      textAlign: TextAlign.center,
                      style: klabelTextStyle,
                    ),
                  )
                ],
              ),
            ),
          ),
          BottomBox(
            buttonTitle: 'RE-CALCULATE',
            onTap: (){
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
