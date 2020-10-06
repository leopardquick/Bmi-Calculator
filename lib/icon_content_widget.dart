import 'package:flutter/material.dart';
import 'constant.dart';

class IconContentWidget extends StatelessWidget {
  IconContentWidget({this.contentIcon,this.contentText});
  final String contentText ;
  final IconData contentIcon;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          contentIcon,
          size: 80.0,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(
          contentText,
          style:kLabelStyle,
        )
      ],
    );
  }
}