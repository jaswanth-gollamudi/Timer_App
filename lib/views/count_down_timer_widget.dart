import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../database/database.dart';

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
    //appDataBase = Provider.of<AppDataBase>(context);

    Duration clockTimer = Duration(seconds: animation.value);
    String timerText =
        '${clockTimer.inHours.remainder(60).toString().padLeft(2, '0')}:${clockTimer.inMinutes.remainder(60).toString().padLeft(2, '0')}:${clockTimer.inSeconds.remainder(60).toString().padLeft(2, '0')}';
      informTimerIsDone(timerText);
    return Text(
      timerText,
      style: const TextStyle(
        fontSize: 32,
        color: Color(0xff006782),
      ),
    );
  }
}
