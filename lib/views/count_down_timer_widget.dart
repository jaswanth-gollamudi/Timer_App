import 'package:flutter/material.dart';
import '../database/database.dart';
import '../themes/app_theme.dart';

class Countdown extends AnimatedWidget {
  Animation<int> animation;
  final Function(String) informTimerIsDone;

  // late AppDataBase appDataBase;
  AllTask task;

  Countdown({
    Key? key,
    required this.animation,
    required this.informTimerIsDone,
    required this.task,
  }) : super(key: key, listenable: animation);

  @override
  build(BuildContext context) {
    Duration clockTimer = Duration(seconds: animation.value);
    String timerText =
        '${clockTimer.inHours.remainder(60).toString().padLeft(2, '0')}:'
        '${clockTimer.inMinutes.remainder(60).toString().padLeft(2, '0')}:'
        '${clockTimer.inSeconds.remainder(60).toString().padLeft(2, '0')}';
    informTimerIsDone(timerText);
    return Text(
      timerText,
      style: appTheme.textTheme.bodyMedium,
      );
  }
}
