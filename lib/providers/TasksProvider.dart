import 'package:flutter/material.dart';
import 'package:flutter_todoapp/models/Task.dart';

class TasksProvider extends ChangeNotifier {
  final List<Task> _tasks = [];

  List<Task> get tasks => _tasks;

  void addTask(Task task) {
    _tasks.add(task);
    notifyListeners();
  }

  void removeTask(Task task) {
    _tasks.remove(task);
    notifyListeners();
  }

  void editTask(Task task, String newTitle, String newDescription) {
    _tasks[_tasks.indexOf(task)].title = newTitle;
    _tasks[_tasks.indexOf(task)].description = newDescription;
    notifyListeners();
  }

  void toggleTask(Task task, bool isDone) {
    _tasks[_tasks.indexOf(task)].isDone = isDone;
    notifyListeners();
  }
}
