import 'package:flutter/material.dart';
import 'package:flutter_todoapp/models/Task.dart';

class TasksProvider extends ChangeNotifier {
  List<Task> _tasks = [];

  List<Task> get tasks => _tasks;

  void addTask(Task task) {
    _tasks.add(task);
    notifyListeners();
  }

  void removeTask(Task task) {
    _tasks.remove(task);
    notifyListeners();
  }

  void updateTask(Task task, String newTitle) {
    task.title = newTitle;
    notifyListeners();
  }

  void toggleTask(Task task) {
    task.isDone = !task.isDone;
    notifyListeners();
  }
}
