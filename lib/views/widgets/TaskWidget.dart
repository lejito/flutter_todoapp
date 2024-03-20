import 'package:flutter/material.dart';
import 'package:flutter_todoapp/models/Task.dart';
import 'package:flutter_todoapp/providers/TasksProvider.dart';
import 'package:flutter_todoapp/utils/NotificationHelper.dart';
import 'package:flutter_todoapp/views/widgets/TaskDialogWidget.dart';
import 'package:provider/provider.dart';

class TaskWidget extends StatelessWidget {
  final Task task;

  TaskWidget({
    required this.task,
  });

  void toggleTask(BuildContext context, TasksProvider tasksProvider) {
    String action = task.isDone ? 'unmarked' : 'marked';
    tasksProvider.toggleTask(task, !task.isDone);
    NotificationHelper.showNotification(
        context, 'Task "${task.title}" $action as completed successfully!');
  }

  void editTask(BuildContext context, TasksProvider tasksProvider) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return TaskDialogWidget.edit(task: task);
      },
    );
  }

  void deleteTask(BuildContext context, TasksProvider tasksProvider) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Confirm delete'),
          content:
              Text('Are you sure you want to delete the task "${task.title}"?'),
          actions: [
            TextButton(
              child: const Text('Cancel'),
              onPressed: () => Navigator.of(context).pop(),
            ),
            TextButton(
              child: const Text('Delete'),
              onPressed: () {
                tasksProvider.removeTask(task);
                Navigator.of(context).pop();
                NotificationHelper.showNotification(
                    context, 'Task "${task.title}" deleted successfully!');
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<TasksProvider>(
      builder: (context, tasksProvider, child) {
        return ListTile(
          leading: Checkbox(
            value: task.isDone,
            onChanged: (bool? value) => toggleTask(context, tasksProvider),
          ),
          title: Text(task.title),
          subtitle: Text(task.description),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                icon: const Icon(Icons.edit),
                onPressed: () => editTask(context, tasksProvider),
              ),
              IconButton(
                icon: const Icon(Icons.delete),
                onPressed: () => deleteTask(context, tasksProvider),
              ),
            ],
          ),
        );
      },
    );
  }
}
