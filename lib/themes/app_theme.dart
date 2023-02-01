import 'package:flutter/material.dart';
import 'package:timer_app/themes/constants.dart';

ThemeData appTheme = ThemeData(
  fontFamily: 'Roboto',
  primaryColor:  AppConstants.splashScreenTextPrimaryColor,
  colorScheme:  const ColorScheme(
    primary: Color(0xFF605CCD),
    secondary: AppConstants.fABColor,
    background: Color(0xFFFFFFFF),
    surface: Color(0xFFFFFFFF),
    onBackground: Colors.white,
    error: Colors.red,
    onError: Colors.white,
    onPrimary: Colors.white,
    onSecondary: Color(0xFF322942),
    onSurface: Color(0xFF241E30),
    brightness: Brightness.light,
  ),

  textTheme:  TextTheme(

    headlineLarge: const TextStyle(
        fontSize: AppConstants.appBarTitleTextSize,
        fontWeight: FontWeight.w400,
        color: Colors.white),

    bodyMedium: const TextStyle(
        fontSize: AppConstants.appBarTitleTextSize,
        //fontWeight: FontWeight.w400,
        color: Color(0xff006782)),

    bodySmall: const TextStyle(
      fontSize: AppConstants.bodySmall,
      color: Colors.black
    ),

    headlineMedium: const TextStyle(
    fontSize: AppConstants.splashScreenTextSize,
    fontWeight: FontWeight.w400,
    color: AppConstants.splashScreenTextPrimaryColor,
    shadows: [
      Shadow(
        color: AppConstants.splashScreenTextShadowColor,
        offset: Offset(-3, 2),
      ),
    ]),


    // headline1: const TextStyle(
    //     fontSize: AppConstants.splashScreenTextSize,
    //     fontWeight: FontWeight.w400,
    //     color: AppConstants.splashScreenTextPrimaryColor,
    //     shadows: [
    //       Shadow(
    //         color: AppConstants.splashScreenTextShadowColor,
    //         offset: Offset(-3, 2),
    //       ),
    //     ]),

/*    subtitle1: TextStyle(
        fontSize: AppConstants.splashScreenTextSize,
        fontWeight: FontWeight.w400,
        color: AppConstants.splashScreenTextPrimaryColor,
        shadows: [
          Shadow(
            color: AppConstants.splashScreenTextShadowColor,
            offset: Offset(-3, 2),
          ),
        ]),

    bodyText1: TextStyle(
        fontSize: AppConstants.splashScreenTextSize,
        fontWeight: FontWeight.w400,
        color: AppConstants.splashScreenTextPrimaryColor,
        shadows: [
          Shadow(
            color: AppConstants.splashScreenTextShadowColor,
            offset: Offset(-3, 2),
          ),
        ]),

    bodyText2: TextStyle(
        fontSize: AppConstants.splashScreenTextSize,
        fontWeight: FontWeight.w400,
        color: AppConstants.splashScreenTextPrimaryColor,
        shadows: [
          Shadow(
            color: AppConstants.splashScreenTextShadowColor,
            offset: Offset(-3, 2),
          ),
        ]),*/

  ),
  // appBarTheme: AppBarTheme(
  //   backgroundColor: appTheme.primaryColor,
  //   titleTextStyle: appTheme.textTheme.headlineLarge
  // )
);
