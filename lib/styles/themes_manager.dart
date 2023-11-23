import 'package:flutter/material.dart';

import 'color_manager.dart';
import 'font_manager.dart';

ThemeData getApplicationTheme(BuildContext context){
  return ThemeData(
    appBarTheme: const AppBarTheme(
      iconTheme: IconThemeData(color: Colors.black),
      backgroundColor: ColorManager.lightColor2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),

      ),
      centerTitle: true,
    ),
    textTheme:   const TextTheme(

      headlineMedium: TextStyle(
        fontSize: FontSize.s16,
        fontWeight: FontWeightManager.regular,
        color: Colors.black,
        fontFamily: FontConstants.arefFontFamily,
      ),
      headlineSmall: TextStyle(
        fontSize: FontSize.s14,
        fontWeight: FontWeightManager.regular,
        color: Colors.black,
        fontFamily: FontConstants.arefFontFamily,
      ),
      headlineLarge: TextStyle(
        fontSize: FontSize.s20,
        color: Colors.black,
        fontFamily: FontConstants.arefFontFamily,

      ),

    )
  );
}