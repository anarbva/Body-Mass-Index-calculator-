import 'dart:math';

class BmiServices{
  double calculate(int weight, double  height){
    return weight / pow(height/100,2);
  }

  String getResultText(int weight, double height){
    final result =calculate(weight,height);
    if(result<16){
      return "Severe Thinness";
    }
    if( 16<  result && result <17 ){
      return "Moderate Thinness";
  }
   if( 17<  result && result <18.5 ){
      return "Mild Thiness";
  }
   if( 18.5<  result && result <25 ){
      return "Normal";
  }
  if( 25<  result && result <30 ){
      return "Overweight";
  }
  if( 30<  result && result <35 ){
      return "Obese class 1";
  }
   if( result >40 ){
      return "Obese class 2";
  }else{
    return "Calculate again";
  }

 
  }
  String getInterpretation(
    int weight, double height
  ){
    final result=calculate(weight, height);
  if(result >= 25){
    return "You have a higher than normal body.TRy to exercise more.";
  } else if(result>=18.5){
    return "You have a normal body weight. Good job!";
  }else{
    return "You have a lower than normal body weight. Eat more!";
  }
 }
  
}