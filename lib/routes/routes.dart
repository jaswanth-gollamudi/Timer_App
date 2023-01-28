import 'package:flutter/material.dart';
import 'package:timer_app/views/dashboard.dart';
import 'package:timer_app/views/splash_screen.dart';


// Route names
const String splashScreen= "splashScreen";
const String dashboardScreen= "dashboardScreen";



Route<dynamic> controller (RouteSettings settings){

  switch(settings.name){
    case splashScreen:
      return MaterialPageRoute(builder: (context) => const SplashScreen());
    case dashboardScreen:
      return MaterialPageRoute(builder: (context) => const Dashboard());
    default :
      return MaterialPageRoute(builder: (context) => const SplashScreen());
  }
}