import 'package:flutter/material.dart';

class AppTextStyles {
  static const Color _defaultColor = Colors.white;

  static TextStyle headLine1({Color? color}) => TextStyle(
    color: color ?? _defaultColor,
    fontSize: 32,
    fontWeight: FontWeight.w700,
    letterSpacing: -1,
  );

  static TextStyle headLine2({Color? color}) => TextStyle(
    color: color ?? _defaultColor,
    fontSize: 28,
    fontWeight: FontWeight.w600,
    letterSpacing: -1,
  );

  static TextStyle headLine3({Color? color}) => TextStyle(
    color: color ?? _defaultColor,
    fontSize: 24,
    fontWeight: FontWeight.w600,
    letterSpacing: -1,
  );

  static TextStyle subtitle1({Color? color}) => TextStyle(
    color: color ?? _defaultColor,
    fontSize: 22,
    fontWeight: FontWeight.w500,
    letterSpacing: -1,
  );

  static TextStyle bodyText1({Color? color}) => TextStyle(
    color: color ?? _defaultColor,
    fontSize: 19,
    fontWeight: FontWeight.w400,
    letterSpacing: -1,
  );

  static TextStyle bodyTextBold1({Color? color}) => TextStyle(
    color: color ?? _defaultColor,
    fontSize: 17,
    fontWeight: FontWeight.bold,
    letterSpacing: -1,
  );

  static TextStyle caption1({Color? color}) => TextStyle(
    color: color ?? _defaultColor,
    fontSize: 18,
    fontWeight: FontWeight.w400,
    letterSpacing: -1,
  );
}
/*import 'package:flutter/material.dart';

class AppTextStyles{
  static const Color textColorDefaultApp = Colors.white;

  static const TextStyle headLine1 = TextStyle(color: textColorDefaultApp,fontSize: 32,fontWeight: FontWeight.w700);
  static const TextStyle headLine2 = TextStyle(color: textColorDefaultApp,fontSize: 28,fontWeight: FontWeight.w600);
  static const TextStyle headLine3= TextStyle(color: textColorDefaultApp,fontSize: 24,fontWeight: FontWeight.w600);
  static const TextStyle subtitle1 = TextStyle(color: textColorDefaultApp,fontSize: 18,fontWeight: FontWeight.w500);
  static const TextStyle bodyText1 = TextStyle(color: textColorDefaultApp,fontSize: 16,fontWeight: FontWeight.w400);
  static const TextStyle bodyText2 = TextStyle(color: textColorDefaultApp,fontSize: 14,fontWeight: FontWeight.w400);
  static const TextStyle caption1 = TextStyle(color: textColorDefaultApp,fontSize: 12,fontWeight: FontWeight.w400);
}*/