import 'package:get/get.dart';
import 'package:practicee/sql/models/task_model.dart';

enum TaskFilter { all, completed, incomplete }

class TaskController extends GetxController {
  List<Task> _tasks = [];
  int _taskCounter = 0;
  TaskFilter taskFilter = TaskFilter.all;
  changeFilter(TaskFilter newFilter) {
    if (taskFilter == newFilter) return;
    taskFilter = newFilter;
    update(
      ['task_list'],
    );
  }

  List<Task> get filteredTasks {
    switch (taskFilter) {
      case TaskFilter.completed:
        return _tasks.where((task) => task.isDone).toList();
      case TaskFilter.incomplete:
        return _tasks.where((task) => !task.isDone).toList();
      case TaskFilter.all:
      default:
        return _tasks;
    }
  }

  Task? getTaskById(int id) {
    try {
      return _tasks.firstWhere((t) => t.id == id);
    } catch (e) {
      return null;
    }
  }

  addTask(String title) {
    _tasks.add(Task(id: _taskCounter++, title: title));
    update(['task_list']);
  }

  updateTask(Task updatedTsk) {
    final index = _tasks.indexWhere((task) => task.id == updatedTsk.id);
    if (index != -1) {
      _tasks[index] = updatedTsk;
      update(['task_${updatedTsk.id}', 'task_list']);
    }
  }

  deleteTask(int id) {
    _tasks.removeWhere((t) => t.id == id);
    update(['task_list']);
  }
}
