
import 'dart:math';

class BmiBrain{
  BmiBrain({this.height,this.weight});
  double _bmi;
  int height;
  int weight;

  String calCulateBmi(){
    _bmi = weight / pow(height/100, 2);
    return _bmi.toStringAsFixed(1);
  }
  String getResult(){
    if(_bmi >= 25 ){
      return 'Overweight';
    }else if(_bmi > 18.5){
      return 'Normal';
    }else {
      return 'Underweight';
    }
  }

  String getInterpretation(){
    if(_bmi >= 25 ){
      return 'You have higher than normal body weight. try to exercise more';
    }else if(_bmi > 18.5){
      return 'You have normal body weight , Good Job';
    }else {
      return 'You have lower than normal body weight , You can eat a bit more';
    }
  }
}