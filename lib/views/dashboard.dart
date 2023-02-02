import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:timer_app/database/database.dart';
import 'package:timer_app/themes/app_theme.dart';
import 'package:timer_app/themes/constants.dart';
import 'package:timer_app/views/task_list_widget.dart';
import 'add_task_dialog.dart';
import '../database/utils/data_provider.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  late AppDataBase appDataBase;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    //
    context.read<TaskData>().fetchTasks();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBar(),
        resizeToAvoidBottomInset: false,
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(bottom: 20, right: 10),
          child: FloatingActionButton(
            onPressed: () {
              showAddTaskOverlayDialog(context);
            },
            backgroundColor: appTheme.colorScheme.secondary,
            child: const Icon(
              Icons.add,
              size: 30,
              color: Colors.black54,
            ),
          ),
        ),
        body: Consumer<TaskData>(
          builder: (context, taskData, child) {
            final tasks = taskData.tasks;
            if (tasks.isEmpty) {
              return noTimerActiveWidget();
            }
            return TaskListWidgetOnDashboard(
              taskToBeShow: tasks,
            );
          },
        ));
  }

  Widget noTimerActiveWidget() {
    return Align(
      alignment: Alignment.bottomRight,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 110),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const SizedBox(
              width: 70,
            ),
            // const Text(AppConstants.noTimerPresentText),
             Text(AppConstants.noTimerPresentText,style: appTheme.textTheme.bodySmall,),
            Image.asset(
              AppConstants.noTimerPresentArrowPath,
            ),
            const SizedBox(),
          ],
        ),
      ),
    );
  }

  appBar() {
    return PreferredSize(
      preferredSize: const Size.fromHeight(124),
      child: Container(
        color: appTheme.primaryColor,
        child: Padding(
          padding:
              const EdgeInsets.only(left: 31, bottom: 12, right: 174, top: 72),
          child: Text(
            AppConstants.appBarTitle,
            style: appTheme.textTheme.headlineLarge,
          ),
        ),
      ),
    );
  }

  showAddTaskOverlayDialog(BuildContext context) {
    showGeneralDialog(
        context: context,
        barrierDismissible: true,
        barrierLabel:
            MaterialLocalizations.of(context).modalBarrierDismissLabel,
        pageBuilder: (
          context,
          Animation<double> animation,
          Animation<double> secondaryAnimation,
        ) {
          return AddTaskDialog();
        }).then((value) {
      final taskData = Provider.of<TaskData>(context, listen: false);
      taskData.fetchTasks();
    });
  }
}
