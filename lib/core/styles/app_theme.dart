import 'package:flutter/material.dart';
import 'package:tikino/core/consts/colors.dart';

class AppTheme {

  static ThemeData mainTheme = ThemeData(

    fontFamily: 'Dana',
    scaffoldBackgroundColor: AppSolidColors.scaffoldBackground,


    textTheme: TextTheme(


      // titles
      titleLarge: TextStyle(
        fontSize: 25,
        fontWeight: .w700,
      ),



      // labels
      labelSmall: TextStyle(
        fontSize: 14,
        fontWeight: .w300
      ),

    ),

  );

}