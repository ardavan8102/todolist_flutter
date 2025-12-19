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
      labelLarge: TextStyle(
        fontSize: 18,
        fontWeight: .w500
      ),

      labelMedium: TextStyle(
        fontSize: 16,
        fontWeight: .w400
      ),
      
      labelSmall: TextStyle(
        fontSize: 14,
        fontWeight: .w300
      ),

    ),

  );

}