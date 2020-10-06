import 'package:bmi/Buttom_buttom.dart';
import 'package:bmi/bmi_brain.dart';
import 'package:bmi/result_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'icon_content_widget.dart';
import 'reusable_card.dart';
import 'constant.dart';



enum Gender {male , female}


class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  Gender selectedGender ;
  int height = 180;
  int weight = 89;
  int age = 19;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
         Expanded(
           child: Row(
             children: [
               Expanded(
                 child:  ReusableCard(
                   cardTap: (){
                     setState(() {
                       selectedGender = Gender.male;
                     });
                   },
                   cardChild: IconContentWidget(
                     contentText:'MALE' ,
                     contentIcon: FontAwesomeIcons.mars,
                   ),
                   colour: selectedGender == Gender.male ? kActiveCardColor : kInactiveCardColor,
                 ) ,
               ),
               Expanded(
                 child: ReusableCard(
                   cardTap: (){
                     setState(() {
                       selectedGender = Gender.female ;
                     });
                   },
                   cardChild: IconContentWidget(
                     contentText: 'FEMALE' ,
                     contentIcon: FontAwesomeIcons.venus,
                   ),
                   colour: selectedGender == Gender.female ? kActiveCardColor : kInactiveCardColor,
                 ) ,
               ),
             ],
           ),
         ),
          Expanded(
            child:  ReusableCard(
              colour: kInactiveCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Height',
                    style: kLabelStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        height.toString(),
                        style: kNumberStyle,
                      ),
                      Text(
                        'cm',
                        style: kLabelStyle,
                      )
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      inactiveTrackColor: Color(0xFF8DE98),
                      activeTrackColor: Colors.white,
                      thumbColor: Color(0xFFEB1555),
                      overlayColor: Color(0x29EB1555),
                      thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
                      overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0)
                    ),
                    child: Slider(
                      value: height.toDouble(),
                      min: 120.0,
                      max: 220.0,
                      onChanged: (double value){
                        setState(() {
                          height = value.toInt() ;
                        });
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child:  ReusableCard(
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'WEIGHT',
                          style: kLabelStyle,
                        ),
                        Text(
                          weight.toString(),
                          style: kNumberStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIConButton(
                              onPressed: (){
                                setState(() {
                                  weight--;
                                });
                              },
                              icon: FontAwesomeIcons.minus,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            RoundIConButton(
                              onPressed: (){
                                setState(() {
                                  weight++;
                                });
                              },
                              icon: FontAwesomeIcons.plus,
                            )
                          ],
                        )
                      ],
                    ),
                    colour: kInactiveCardColor,
                  ),
                ),
                Expanded(
                  child:  ReusableCard(
                    colour: kInactiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'AGE',
                          style: kLabelStyle,
                        ),
                        Text(
                          age.toString(),
                          style: kNumberStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIConButton(
                              onPressed: (){
                                setState(() {
                                  age--;
                                });
                              },
                              icon: FontAwesomeIcons.minus,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            RoundIConButton(
                              onPressed: (){
                                setState(() {
                                  age++;
                                });
                              },
                              icon: FontAwesomeIcons.plus,
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          ButtonDown(
            title: 'CALCULATE',
            onPress: (){
              BmiBrain bmiBrain = BmiBrain(height: height,weight: weight);
              String bmi = bmiBrain.calCulateBmi();
              String result = bmiBrain.getResult();
              String interpretation = bmiBrain.getInterpretation();

              print(bmi);
              print(result);
              print(interpretation);
              Navigator.push(context, MaterialPageRoute(builder: (context)=> ResultPage(bmi: bmi,result: result,inter: interpretation,))
               );


            },
          )
        ],
      ) ,
    );
  }
}


class RoundIConButton extends StatelessWidget {
  RoundIConButton({@required this.onPressed , this.icon});
  final IconData icon;
  final Function onPressed ;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      elevation: 0.0,
      child: Icon(
        icon,
      ),
      fillColor: Color(0xFF4C4F5E),
      shape: CircleBorder(),
      constraints:  BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
    );
  }
}




