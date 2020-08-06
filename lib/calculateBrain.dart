import 'dart:math';

class CalculateBrain{
  final int height;
  final int weight;
  double _bmi;

  CalculateBrain({this.height, this.weight}){
    this._bmi = this.weight/ pow(this.height/100, 2);
  }

  String getBMI(){
    return _bmi.toStringAsFixed(1);
  }

  String getResult(){
    if(_bmi >= 25){
      return 'OverWeight';
    }else if(_bmi > 18.5){
      return 'Normal';
    }else{
      return 'Underweight';
    }
  }

  String getInterpretation(){
    if(_bmi >= 25){
      return 'You have a higher than normal body weight. Try to exercise more!';
    }else if(_bmi > 18.5){
      return 'You have a normal body weight. God Job!';
    }else{
      return 'You have a lower than normal body weight. You can eat a bit more!';
    }
  }
}