import 'package:drift/drift.dart' as dr;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:timer_app/database/database.dart';
import 'package:timer_app/themes/app_theme.dart';
import 'package:timer_app/themes/constants.dart';

import '../database/utils/data.dart';

class AddTaskDialog extends StatefulWidget {
  AddTaskDialog({Key? key}) : super(key: key);

  @override
  State<AddTaskDialog> createState() => _AddTaskDialogState();
}

class _AddTaskDialogState extends State<AddTaskDialog> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController hoursController = TextEditingController(text: "00");
  TextEditingController minutesController = TextEditingController(text: "00");
  TextEditingController secondsController = TextEditingController(text: "00");

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: AppConstants.addTaskDialogBgColor,
        ),
        height: MediaQuery.of(context).size.height - 200,
        width: MediaQuery.of(context).size.width - 70,
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: AppConstants.addTaskDialogBgColor,
          body: SingleChildScrollView(
            padding: const EdgeInsets.only(left: 32),
            reverse: true,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    top: 48,
                  ),
                  child: Text(AppConstants.addTaskHeaderTitle,
                      style: appTheme.textTheme.headlineLarge?.copyWith(
                        color: AppConstants.addTaskTitleColor,
                        decoration: TextDecoration.none,
                      )),
                ),
                // const SizedBox(
                //   height: 20,
                // ),
                Padding(
                  padding: const EdgeInsets.only(right: 64, top: 20),
                  child: TextField(
                    controller: titleController,
                    textDirection: TextDirection.ltr,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Title',
                    ),
                  ),
                ),
                // const SizedBox(
                //   height: 36,
                // ),
                Padding(
                  padding: const EdgeInsets.only(right: 64, top: 36),
                  child: TextField(
                    controller: descriptionController,
                    textDirection: TextDirection.ltr,
                    textAlign: TextAlign.justify,
                    maxLines: 6,
                    textAlignVertical: TextAlignVertical.top,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Description',
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 28, bottom: 10),
                  child: Text("Duration"),
                ),
                Row(
                  children: [
                    timePickerWidget(title: "HH", controller: hoursController),
                    timePickerWidget(
                        title: "MM", controller: minutesController),
                    timePickerWidget(
                        title: "SS",
                        lastBox: true,
                        controller: secondsController),
                  ],
                ),
                Padding(
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom)),
              ],
            ),
          ),
          bottomNavigationBar: GestureDetector(
            onTap: () {
              _saveToDb();
            },
            child: Container(
              // alignment: Alignment.bottomCenter,
              color: AppConstants.addTaskButtonColor,
              padding: EdgeInsets.zero,
              height: 61,
              width: MediaQuery.of(context).size.width,
              child: Center(
                  child: Text(
                AppConstants.addTaskHeaderTitle,
                style: appTheme.textTheme.bodySmall,
              )),
            ),
          ),
        ),
      ),
    );
  }

  // customize this.
  Widget timePickerWidget(
      {TextEditingController? controller,
      required String title,
      bool lastBox = false}) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              width: 40,
              color: const Color(0xffA7F4A6),
              child: TextField(
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  LengthLimitingTextInputFormatter(2),
                ],
                controller: controller,
                style: appTheme.textTheme.headlineLarge?.copyWith(
                  color: AppConstants.addTaskTitleColor,
                  fontSize: 12,
                ),
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            if (!lastBox)
              const Padding(
                padding: EdgeInsets.only(left: 6, right: 6),
                child: Text(":"),
              ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(right: 20, top: 5),
          child: Text(title),
        ),
      ],
    );
  }

  void _saveToDb() {
    final taskData = Provider.of<TaskData>(context, listen: false);
    taskData
        .addTask(AllTasksCompanion(
            title: dr.Value(titleController.text),
            description: dr.Value(descriptionController.text),
            isTaskCompleted: const dr.Value(false),
            isTaskPaused: const dr.Value(false),
            currentTime: dr.Value(""),
            time: dr.Value("${hoursController.text}:"
                "${minutesController.text}:"
                "${secondsController.text}")))
        .then((value) {
      Navigator.pop(context, true);
    });
  }
}
