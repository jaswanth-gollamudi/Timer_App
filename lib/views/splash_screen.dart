import 'dart:async';

import 'package:flutter/material.dart';
import 'package:timer_app/routes/routes.dart' as route;
import 'package:timer_app/themes/app_theme.dart';
import 'package:timer_app/themes/constants.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}


class _SplashScreenState extends State<SplashScreen> {


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(const Duration(seconds: 2), (){
      Navigator.pushNamed(context,route.dashboardScreen);
    });
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(AppConstants.splashScreenImagePath,),
          const SizedBox(height: AppConstants.splashScreenTextSize,),
          Text(AppConstants.splashScreenTitle ,style: appTheme.textTheme.headline1,),
        ],
      )),
    );
  }
}
