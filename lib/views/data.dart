

import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../database/database.dart';

// class ManageDbActions  extends ChangeNotifier {
//
//
//    late AppDataBase appDataBase;
//
//
//
//   Future<List<AllTask>> getTasksFromDataBase() async {
//     List<AllTask> taskList =  await appDataBase.getTaskList();
//     notifyListeners();
//     return taskList;
//
//   }
// }



class TaskData extends ChangeNotifier {
  final AppDataBase _appDataBase;
  List<AllTask> _tasks = [];

  TaskData(this._appDataBase);

  List<AllTask> get tasks => _tasks;

  set tasks(List<AllTask> newTasks) {
    _tasks = newTasks;
    notifyListeners();
  }

  Future<void> fetchTasks() async {
    final tasks = await _appDataBase.getTaskList();
    _tasks = tasks;
    print("tasksssssssss");
    print(tasks.toString());
    notifyListeners();
  }

  Future<void> addTask(AllTasksCompanion allTasksCompanion) async {
     await _appDataBase.insertTask(allTasksCompanion);
    print("taskAdded");
    notifyListeners();
  }

  Future<void> deleteTask(AllTask task) async {
    await _appDataBase.deleteTask(task);
    print("deletetask");
    notifyListeners();
  }

Future<void> updateTask(AllTask task) async {
  await _appDataBase.updateTask(task);
  print(task.time.toString()+"isitUpdating");
  //final index = _tasks.indexWhere((element) => element.id == task.id);
  // _tasks[index] = task;
  //notifyListeners();
}



  // Future<void> addTask(AllTask task) async {
  //   await _appDataBase.allTaskDao.insertTask(task);
  //   _tasks.add(task);
  //   notifyListeners();
  // }
  //
  // Future<void> updateTask(AllTask task) async {
  //   await _appDataBase.allTaskDao.updateTask(task);
  //   final index = _tasks.indexWhere((element) => element.id == task.id);
  //   _tasks[index] = task;
  //   notifyListeners();
  // }
  //
  // Future<void> deleteTask(AllTask task) async {
  //   await _appDataBase.allTaskDao.deleteTask(task);
  //   _tasks.removeWhere((element) => element.id == task.id);
  //   notifyListeners();
  // }
}
