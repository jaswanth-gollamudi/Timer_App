import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:timer_app/database/database.dart';
import 'package:timer_app/themes/app_theme.dart';
import 'package:timer_app/database/utils/data.dart';
import 'routes/routes.dart' as route;

void main() {
  runApp(const TimerApp());
}

class TimerApp extends StatelessWidget {
  const TimerApp({key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create : (context) => TaskData(AppDataBase()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: appTheme,
        onGenerateRoute: route.controller,
        initialRoute: route.splashScreen,
      ),
    );
  }
}


