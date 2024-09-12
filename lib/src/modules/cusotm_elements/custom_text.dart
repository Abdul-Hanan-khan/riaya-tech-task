import 'package:fit_journey/src/core/utils/app_fonts.dart';
import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color textColor;
  final String? fontFamily;
  final FontWeight fontWeight;
  final TextAlign textAlign;
  final bool ?lineThrough;
  final int ?maxLines;

  // Constructor with optional parameters
  CustomText({
    required this.text,
    this.fontSize = 18.0,
    this.textColor = Colors.black,
    this.fontFamily,
    this.maxLines,
    this.fontWeight = FontWeight.normal,
    this.textAlign = TextAlign.left,
    this.lineThrough ,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize,
        color: textColor,
        fontFamily: fontFamily??AppFonts.PoppinsRegular,
        fontWeight: fontWeight,
        decoration: lineThrough == null || lineThrough == false?TextDecoration.none:TextDecoration.lineThrough,
        overflow: TextOverflow.ellipsis,
      ),
      maxLines: maxLines ?? 2,
      
      textAlign: textAlign,
    );
  }
}