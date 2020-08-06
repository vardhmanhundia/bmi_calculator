import 'package:bmi_calculator/results_Page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import './reusable_Card.dart';
import './reusableIcon.dart';
import 'constants.dart';
import 'results_Page.dart';
import 'bottomButton.dart';
import 'calculateBrain.dart';

enum Gender{
  male,
  female
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender;
  int height = 180;
  int weight = 30;
  int age = 10;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(child: Row(
            children: <Widget>[
              Expanded(
                child: ReusableCard(
                    onPress: (){
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    colour: selectedGender == Gender.male? kactiveCardColor: kinactiveCardColor,
                    cardChild: ReusableIcon(icon: FontAwesomeIcons.mars, label:'MALE' ),
                ),
              ),
              Expanded(
                child: ReusableCard(
                    onPress: (){
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                    colour: selectedGender == Gender.female? kactiveCardColor: kinactiveCardColor,
                    cardChild: ReusableIcon(icon: FontAwesomeIcons.venus, label:'FEMALE' ),
                ),

              ),
            ]
          )),
          Expanded(child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                      colour: kactiveCardColor,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text('HEIGHT',
                          style: klabelTextStyle
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            textBaseline: TextBaseline.alphabetic,
                            children: <Widget>[
                              Text(
                                '$height',
                                style: kConstantStyle,
                              ),
                              Text(
                                'cm',
                                style: klabelTextStyle,
                              )
                            ],
                          ),
                          SliderTheme(
                            data: SliderTheme.of(context).copyWith(
                                thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
                                overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0),
                                inactiveTrackColor: Color(0xFF8D8E98),
                                activeTrackColor: Color(0xFFEB1555),
                                thumbColor: Color(0xFFEB1555),
                                overlayColor: Color(0x22EB1555)
                            ),
                            child: Slider(
                              value: height.toDouble(),
                              min: 120.0,
                              max: 220.0,
                              
                              onChanged: (double newValue){
                                  setState(() {
                                    height = newValue.toInt();
                                  });
                              },
                            ),
                          )
                        ],
                      ),
                  ),
                ),
              ]
          )),
          Expanded(child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    colour: kactiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'WEIGHT',
                          style: klabelTextStyle,
                        ),
                        Text(
                          '$weight',
                          style: kConstantStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPress: () {
                                setState(() {
                                  weight--;
                                });
                              },
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPress: (){
                                setState(() {
                                  weight++;
                                });
                              },
                            )

                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    colour: kactiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'AGE',
                          style: klabelTextStyle,
                        ),
                        Text(
                          '$age',
                          style: kConstantStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPress: (){
                                setState(() {
                                  age--;
                                });
                              },
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPress: (){
                                setState(() {
                                  age++;
                                });
                              },
                            )

                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ]
          )),
          BottomBox(
            buttonTitle: 'CALCULATE',
            onTap: (){
              CalculateBrain cb = CalculateBrain(height: height, weight: weight);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context){
                        return ResultsPage(result: cb);
                      }
                  )
              );
            },
          ),
        ]
      ),
    );
  }
}

class RoundIconButton extends StatelessWidget {

  final IconData icon;
  final Function onPress;
  RoundIconButton({this.icon, @required this.onPress});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(
        icon,
        color: Colors.white,
      ),
      shape: CircleBorder(),
      onPressed: onPress,
      elevation: 6.0,
      fillColor:  Color(0xFF4C4F5E),
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0
      ),

    );
  }
}



