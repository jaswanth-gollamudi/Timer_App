import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:timer_app/themes/app_theme.dart';

import '../database/database.dart';
import 'count_down_timer_widget.dart';
import 'package:drift/drift.dart' as dr;

import 'data.dart';

class TaskListWidgetOnDashboard extends StatefulWidget {
  List<AllTask> taskToBeShow;
  final Function(bool) updateListBasedOnAction;

  TaskListWidgetOnDashboard(
      {Key? key,
      required this.taskToBeShow,
      required this.updateListBasedOnAction})
      : super(key: key);

  @override
  _TaskListWidgetOnDashboardState createState() =>
      _TaskListWidgetOnDashboardState();
}

class _TaskListWidgetOnDashboardState extends State<TaskListWidgetOnDashboard>
    with TickerProviderStateMixin {
  //late AppDataBase appDataBase;

  //late AnimationController _controller;
  int levelClock = 0;
  bool firstTime = false;

  // bool isPaused = false;

  final Map<int, AnimationController> _animationControllers = {};
  final Map<int, String> currValuesForTasks = {};

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    widget.taskToBeShow.asMap().forEach((index, task) {
      int levelClock = convertTimeToSeconds(
          time: task.currentTime.isNotEmpty ? task.currentTime : task.time);
      _animationControllers[index] = AnimationController(
        vsync: this,
        duration: Duration(seconds: levelClock),
      );
    });
  }

  @override
  void dispose() {
    _animationControllers.values.forEach((controller) => controller.dispose());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, i) {
        return taskCardWidget(widget.taskToBeShow[i], i);
      },
      itemCount: widget.taskToBeShow.length,
    );
  }

  Widget taskCardWidget(AllTask task, int index) {
    return Container(
      margin: const EdgeInsets.only(left: 31, right: 31, top: 10, bottom: 20),
      width: double.infinity,
      height: 196,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: const Color(0xffEDF5F8),
      ),
      //padding: const EdgeInsets.only(left: 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        //mainAxisAlignment: MainAxisAlignment.end,
        children: [
          const SizedBox(
            height: 25,
          ),
          (task.isTaskCompleted)
              ? finishedWidget()
              : countDownWidget(index, task),
          const SizedBox(
            height: 11,
          ),
          buildTextWidget(
              title: task.title, color: const Color(0xff216C2E), size: 22),
          const SizedBox(
            height: 2,
          ),
          buildTextWidget(
              title: task.description,
              color: const Color(0xff006782),
              size: 14),
          const Spacer(),
          if (task.isTaskCompleted) completedButton(index),
        ],
      ),
    );
  }

  Widget buildTextWidget(
      {required String title, required Color color, required double size}) {
    return Padding(
      padding: const EdgeInsets.only(left: 32),
      child: Text(
        title,
        style: appTheme.textTheme.headlineLarge?.copyWith(
            color: color, fontWeight: FontWeight.w400, fontSize: size),
      ),
    );
  }

  Widget countDownWidget(int index, AllTask task) {
    print("taskTime");
    int levelClock = convertTimeToSeconds(
        time: task.currentTime.isNotEmpty ? task.currentTime : task.time);
    if (_animationControllers[index] == null) {
      _animationControllers[index] = AnimationController(
        vsync: this,
        duration: Duration(seconds: levelClock),
      );
    }
    if (task.isTaskPaused) {
      _animationControllers[index]?.stop();
    } else {
      _animationControllers[index]
          ?.forward(from: _animationControllers[index]?.value);
    }
    //_animationControllers[index]?.forward();

    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Countdown(
          task: task,
          informTimerIsDone: (value) {
            currValuesForTasks[index] = value;
            print("currValuesForTasks" + currValuesForTasks.toString());
            if (currValuesForTasks[index] == "00:00:00") {
              updateTaskCompletedInDb(indexTobeUpdated: index);
            }
          },
          animation: StepTween(
            begin: levelClock, // THIS IS A USER ENTERED NUMBER
            end: 0,
          ).animate(_animationControllers[index]!),
        ),
        const SizedBox(
          width: 8,
        ),
        task.isTaskPaused
            ? GestureDetector(
                onTap: () {
                  _animationControllers[index]?.forward();
                  updatePlayAndPauseInDb(
                      indexTobeUpdated: index, isPlayOrPause: "play");
                },
                child: Image.asset(
                  "assets/images/ic_pause.png",
                ),
              )
            : GestureDetector(
                onTap: () {
                  _animationControllers[index]?.stop();
                  updatePlayAndPauseInDb(
                      indexTobeUpdated: index, isPlayOrPause: "pause");
                },
                child: Image.asset(
                  "assets/images/ic_play.png",
                ),
              ),
        const SizedBox(
          width: 8,
        ),
        GestureDetector(
            onTap: () {
              _deleteTaskFromDb(indexTobeDeleted: index);
            },
            child: Image.asset(
              "assets/images/ic_stop.png",
            )),
        const SizedBox(
          width: 30,
        )
      ],
    );
  }

  Widget finishedWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Image.asset(
          "assets/images/ic_sound_wave.png",
        ),
        Text(
          "FINISHED",
          style: appTheme.textTheme.headlineLarge?.copyWith(
              color: const Color(0xff006782),
              fontWeight: FontWeight.w400,
              fontSize: 32),
        ),
        Image.asset(
          "assets/images/ic_sound_wave.png",
        ),
      ],
    );
  }

  Widget completedButton(int index) {
    return GestureDetector(
      onTap: () {
        _deleteTaskFromDb(indexTobeDeleted: index);
      },
      child: Container(
        height: 40,
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: const Color(0xffE1DFFF)),
        child: const Center(
            child: Text(
          "MARK COMPLETE",
        )),
      ),
    );
  }

  void _deleteTaskFromDb({required int indexTobeDeleted}) {
    final taskData = Provider.of<TaskData>(context, listen: false);
    taskData.deleteTask(widget.taskToBeShow[indexTobeDeleted]).then((value) {
      taskData.fetchTasks();
    });
  }

  void updatePlayAndPauseInDb(
      {required int indexTobeUpdated, isPlayOrPause = false}) {
    final taskData = Provider.of<TaskData>(context, listen: false);
    AllTask task = AllTask(
      id: widget.taskToBeShow[indexTobeUpdated].id,
      title: widget.taskToBeShow[indexTobeUpdated].title,
      description: widget.taskToBeShow[indexTobeUpdated].description,
      time: currValuesForTasks[indexTobeUpdated]!,
      isTaskCompleted: false,
      isTaskPaused: isPlayOrPause == "pause" ? true : false,
      currentTime: currValuesForTasks[indexTobeUpdated]!,
    );
    taskData.updateTask(task).then((value) {
      taskData.fetchTasks();
      // print("taskData" + taskData.toString());
    });
  }

  void updateTaskCompletedInDb({
    required int indexTobeUpdated,
  }) {
    final taskData = Provider.of<TaskData>(context, listen: false);
    AllTask task = AllTask(
      id: widget.taskToBeShow[indexTobeUpdated].id,
      title: widget.taskToBeShow[indexTobeUpdated].title,
      description: widget.taskToBeShow[indexTobeUpdated].description,
      time: "00:00:00",
      isTaskCompleted: true,
      isTaskPaused: true,
      currentTime: "",
    );
    taskData.updateTask(task).then((value) {
      taskData.fetchTasks();
      // print("taskData" + taskData.toString());
    });
  }

  convertTimeToSeconds({required String time}) {
    Duration duration = Duration(
        hours: int.parse(time.split(':')[0]),
        minutes: int.parse(time.split(':')[1]),
        seconds: int.parse(time.split(':')[2]));
    int seconds = duration.inSeconds;
    return seconds;
  }

// void updatePlayPauseActionsInDb({
//   required int indexTobeUpdated,
//   required String playOrPause,
//   required String currentValue,
// }) {
//   appDataBase
//       .updateTask(AllTask(
//           id: widget.taskToBeShow[indexTobeUpdated].id,
//           title: widget.taskToBeShow[indexTobeUpdated].title,
//           description: widget.taskToBeShow[indexTobeUpdated].description,
//           time: currentValue,
//           isTaskCompleted: false,
//           isTaskPaused: playOrPause == "pause" ? true : false))
//       .then((value) {
//     widget.updateListBasedOnAction(true);
//   });
// }

// void updateCompletedTasksInDb({
//   required int indexTobeUpdated,
//   /*required String currTime*/
// }) {
//   appDataBase
//       .updateTask(AllTask(
//     id: widget.taskToBeShow[indexTobeUpdated].id,
//     title: widget.taskToBeShow[indexTobeUpdated].title,
//     description: widget.taskToBeShow[indexTobeUpdated].description,
//     time: "00:00:00",
//     isTaskCompleted: true,
//     isTaskPaused: false,
//   ))
//       .then((value) {
//     widget.updateListBasedOnAction(true);
//     print("hereIsrnot");
//
//   });
// }

// void updateRealDataInDb(
//     {required int indexTobeUpdated, required String currTime}) {
//   final taskData = Provider.of<TaskData>(context, listen: false);
//   taskData.updateTask(AllTask(
//     id: widget.taskToBeShow[indexTobeUpdated].id,
//     title: widget.taskToBeShow[indexTobeUpdated].title,
//     description: widget.taskToBeShow[indexTobeUpdated].description,
//     time: currTime,
//     c
//     isTaskCompleted: false,
//     isTaskPaused: false,
//   ));
//   // appDataBase
//   //     .updateTask(
//   //     AllTask(
//   //   id: widget.taskToBeShow[indexTobeUpdated].id,
//   //   title: widget.taskToBeShow[indexTobeUpdated].title,
//   //   description: widget.taskToBeShow[indexTobeUpdated].description,
//   //   time: currTime,
//   //   isTaskCompleted: currTime =="00:00:00"? true : false,
//   //   isTaskPaused: false,
//   // )
//   // )
//   //     .then((value) {
//   //       if(currTime=="00:00:00"){
//   //         widget.updateListBasedOnAction(true);
//   //       }
//   // });
// }


}
