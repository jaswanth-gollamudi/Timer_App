import 'package:flutter/cupertino.dart';
import '../database.dart';

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
    print(tasks.toString());
    notifyListeners();
  }

  Future<void> addTask(AllTasksCompanion allTasksCompanion) async {
    await _appDataBase.insertTask(allTasksCompanion);
    notifyListeners();
  }

  Future<void> deleteTask(AllTask task) async {
    await _appDataBase.deleteTask(task);
    notifyListeners();
  }

  Future<void> updateTask(AllTask task) async {
    await _appDataBase.updateTask(task);
    notifyListeners();
  }
}
