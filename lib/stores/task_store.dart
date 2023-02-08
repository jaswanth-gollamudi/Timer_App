import 'package:mobx/mobx.dart';
import 'package:timer_app/models/task.dart';
part 'task_store.g.dart';

class TaskStore = _TaskStoreBase with _$TaskStore;

abstract class _TaskStoreBase with Store {
  @observable
  ObservableList<Task> tasks = <Task>[].asObservable();

  @action
  addTask(Task task) {
    tasks.add(task);
  }

  @action
  pauseTask(Task task) {
    tasks[tasks.indexOf(task)] = task.copyWith(
      timerState: TimerState.paused,
      lastActionHappened: DateTime.now(),
      remainingDurationWhenLastActionHappened:
          task.remainingDurationWhenLastActionHappened -
              DateTime.now().difference(task.lastActionHappened),
    );
  }

  @action
  playTask(Task task) {
    tasks[tasks.indexOf(task)] = task.copyWith(
      timerState: TimerState.running,
      lastActionHappened: DateTime.now(),
    );
  }

  @action
  completeTask(Task task) {
    tasks.remove(task);
  }
}
