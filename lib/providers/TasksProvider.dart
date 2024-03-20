import 'package:flutter/material.dart';
import 'package:flutter_todoapp/models/Task.dart';

class TasksProvider extends ChangeNotifier {
  final List<Task> _tasks = [
    Task(title: 'Task 1', description: 'Description 1'),
    Task(title: 'Task 2', description: 'Description 2'),
    Task(title: 'Task 3', description: 'Description 3'),
  ];

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
    _tasks[_tasks.indexOf(task)].title = newTitle;
    notifyListeners();
  }

  void toggleTask(Task task, bool isDone) {
    _tasks[_tasks.indexOf(task)].isDone = isDone;
    notifyListeners();
  }
}
