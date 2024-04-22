import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_todoapp/models/Task.dart';

class TasksProvider extends ChangeNotifier {
  final CollectionReference _tasks =
      FirebaseFirestore.instance.collection('tasks');

  Stream<List<Task>> getTasks() {
    return _tasks.snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        return Task.fromMap(
          id: doc.id,
          doc.data() as Map<String, dynamic>,
        );
      }).toList();
    });
  }

  Future<void> addTask(Task task) async {
    await _tasks.add(task.toMapWithoutId());
    notifyListeners();
  }

  Future<void> removeTask(Task task) async {
    await _tasks.doc(task.id).delete();
    notifyListeners();
  }

  Future<void> editTask(
      Task task, String newTitle, String newDescription) async {
    _tasks.doc(task.id).update({
      'title': newTitle,
      'description': newDescription,
    });
    notifyListeners();
  }

  Future<void> toggleTask(Task task, bool isDone) async {
    _tasks.doc(task.id).update({
      'isDone': isDone,
    });
    notifyListeners();
  }
}
