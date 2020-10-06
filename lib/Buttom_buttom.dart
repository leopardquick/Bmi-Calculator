 import 'package:flutter/material.dart';
import 'constant.dart';


class ButtonDown extends StatelessWidget {

  ButtonDown({@required this.title,@required this.onPress});
  final Function onPress;
  final String title;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        color: Color(kBottomColor),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.bold
            ),
          ),
        ),
        margin: EdgeInsets.only(top: 10.0),
        width: double.infinity,
        height: kBottomHeight,
      ),
    );
  }
}
