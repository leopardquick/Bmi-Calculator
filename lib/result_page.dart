import 'package:bmi/Buttom_buttom.dart';
import 'package:bmi/constant.dart';
import 'package:bmi/reusable_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class ResultPage extends StatelessWidget {

  ResultPage({this.result,this.bmi,this.inter});

  final String bmi;
  final String result;
  final String inter;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body:Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: EdgeInsets.all(15),
            child: Text(
              'Your Result',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25.0
            ),
            ),
          ),
          Expanded(
            child: ReusableCard(
              colour: kInactiveCardColor,
              cardTap: (){},
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    result,
                     style: TextStyle(
                       color: Colors.green,
                     ),
                  ),
                  Text(
                    bmi,
                    style: TextStyle(
                      fontSize: 70,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(20),
                    child: Text(
                      inter,
                    ),
                  ),
                ],
              ),
            ),
          ),
          ButtonDown(
            title: 'RE-CALCULATE',
            onPress: (){
              Navigator.pop(context);
            },
          )
        ],
      ) ,
    );
  }
}
