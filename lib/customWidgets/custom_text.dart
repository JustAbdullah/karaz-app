import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TextCustom extends StatelessWidget {
  final String theText;
  final double fontSizeWidth;
  final String fontFamily;
  final Color fontColor;

  double? Theheight = 0.002;
  FontWeight fontWeight;

  TextCustom({
    super.key,
    required this.theText,
    required this.fontSizeWidth,
    required this.fontFamily,
    required this.fontColor,
    this.Theheight,
    this.fontWeight = FontWeight.normal,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      theText,
      style: TextStyle(
          height: Theheight,
          fontFamily: fontFamily,
          color: fontColor,
          fontSize: fontSizeWidth,
          fontWeight: fontWeight),
      textAlign: TextAlign.center,
    );
  }
}
