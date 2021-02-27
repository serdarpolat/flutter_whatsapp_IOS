import 'package:flutter/material.dart';

double hh(double height) {
  return (960 * height) / 812;
}

double ww(double width) {
  return (454.7368421 * width) / 375;
}

//* Colors
Color black = Color(0xFF000000);
Color white = Color(0xFFFFFFFF);
Color textGrey = Color(0xFF8e8e93);
Color iconGrey = Color(0xFFc6c6cc);
Color barGrey = Color(0xFFF6F6F6);
Color barShadowGrey = Color(0xFFA6A6AA);
Color accentColor = Color(0xFFA007AFF);
Color green = Color(0xFF60BB58);
Color lightGreen = Color(0xffDCF7C5);
Color blueGray = Color(0xFF3E70A7);
Color primary = Color(0xFFff3b30);

//* Text Styles
TextStyle reg20({Color color}) => TextStyle(
      color: color,
      fontSize: hh(20),
      fontWeight: FontWeight.w400,
    );
TextStyle reg17({Color color}) => TextStyle(
      color: color,
      fontSize: hh(17),
      fontWeight: FontWeight.w400,
    );
TextStyle reg16({Color color}) => TextStyle(
      color: color,
      fontSize: hh(16),
      fontWeight: FontWeight.w400,
    );
TextStyle reg14({Color color}) => TextStyle(
      color: color,
      fontSize: hh(14),
      fontWeight: FontWeight.w400,
    );
TextStyle reg12({Color color}) => TextStyle(
      color: color,
      fontSize: hh(12),
      fontWeight: FontWeight.w400,
    );
TextStyle med10({Color color}) => TextStyle(
      color: color,
      fontSize: hh(10),
      fontWeight: FontWeight.w500,
    );
TextStyle semi19({Color color}) => TextStyle(
      color: color,
      fontSize: hh(19),
      fontWeight: FontWeight.w600,
    );
TextStyle semi17({Color color}) => TextStyle(
      color: color,
      fontSize: hh(17),
      fontWeight: FontWeight.w600,
    );
TextStyle semi16({Color color}) => TextStyle(
      color: color,
      fontSize: hh(16),
      fontWeight: FontWeight.w600,
    );
TextStyle bold34({Color color}) => TextStyle(
      color: color,
      fontSize: hh(34),
      fontWeight: FontWeight.w700,
    );
