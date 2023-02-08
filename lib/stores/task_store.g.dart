// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$TaskStore on _TaskStoreBase, Store {
  late final _$tasksAtom = Atom(name: '_TaskStoreBase.tasks', context: context);

  @override
  ObservableList<Task> get tasks {
    _$tasksAtom.reportRead();
    return super.tasks;
  }

  @override
  set tasks(ObservableList<Task> value) {
    _$tasksAtom.reportWrite(value, super.tasks, () {
      super.tasks = value;
    });
  }

  late final _$_TaskStoreBaseActionController =
      ActionController(name: '_TaskStoreBase', context: context);

  @override
  dynamic addTask(Task task) {
    final _$actionInfo = _$_TaskStoreBaseActionController.startAction(
        name: '_TaskStoreBase.addTask');
    try {
      return super.addTask(task);
    } finally {
      _$_TaskStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic pauseTask(Task task) {
    final _$actionInfo = _$_TaskStoreBaseActionController.startAction(
        name: '_TaskStoreBase.pauseTask');
    try {
      return super.pauseTask(task);
    } finally {
      _$_TaskStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic playTask(Task task) {
    final _$actionInfo = _$_TaskStoreBaseActionController.startAction(
        name: '_TaskStoreBase.playTask');
    try {
      return super.playTask(task);
    } finally {
      _$_TaskStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic completeTask(Task task) {
    final _$actionInfo = _$_TaskStoreBaseActionController.startAction(
        name: '_TaskStoreBase.completeTask');
    try {
      return super.completeTask(task);
    } finally {
      _$_TaskStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
tasks: ${tasks}
    ''';
  }
}
