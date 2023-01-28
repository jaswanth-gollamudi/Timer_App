import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

part 'database.g.dart';


class AllTasks extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text()();
  TextColumn get description => text().named('description')();
  TextColumn get time => text().named('time')();
  TextColumn get currentTime => text().named('currentTime')();
  BoolColumn get isTaskCompleted => boolean()();
  BoolColumn get isTaskPaused => boolean()();
}



LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return NativeDatabase.createInBackground(file);
  });
}


@DriftDatabase(tables: [AllTasks])
class AppDataBase extends _$AppDataBase {
  AppDataBase() : super(_openConnection());


  @override
  int get schemaVersion => 1;



  //GET ALL THE TASKS FROM DB
  Future<List<AllTask>> getTaskList() async {
    return await select(allTasks).get();
  }

  //INSERT NEW NOTE IN DB
  Future<int> insertTask(AllTasksCompanion tasksCompanion) async {
    return await into(allTasks).insert(tasksCompanion);
  }

  Future<int> deleteTask(AllTask task) async {
    return await delete(allTasks).delete(task);
  }

  // UPDATE NOTES
  Future<bool> updateTask(AllTask task) async {

    return await update(allTasks).replace(task);
  }



}

