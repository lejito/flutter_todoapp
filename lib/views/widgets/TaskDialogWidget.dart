import 'package:flutter/material.dart';
import 'package:flutter_todoapp/models/Task.dart';
import 'package:flutter_todoapp/providers/TasksProvider.dart';
import 'package:provider/provider.dart';

class TaskDialogWidget extends StatelessWidget {
  final bool isEditing;
  final String title;
  final String description;

  TaskDialogWidget(
      {this.title = '', this.description = '', this.isEditing = false});

  TaskDialogWidget.edit({required Task task})
      : isEditing = true,
        title = task.title,
        description = task.description;

  @override
  Widget build(BuildContext context) {
    return Consumer<TasksProvider>(builder: (context, tasksProvider, child) {
      return AlertDialog(
        title: Text(isEditing ? 'Edit task' : 'Create task'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              decoration: const InputDecoration(
                labelText: 'Title',
              ),
              controller: TextEditingController(text: title),
            ),
            TextField(
              decoration: const InputDecoration(
                labelText: 'Description',
              ),
              controller: TextEditingController(text: description),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              String newTitle = title;
              String newDescription = description;

              if (isEditing) {
                // Perform update logic here
              } else {
                // Perform delete logic here
              }

              Navigator.of(context).pop();
            },
            child: Text(isEditing ? 'Edit' : 'Create'),
          ),
        ],
      );
    });
  }
}
