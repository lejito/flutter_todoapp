import 'package:flutter/material.dart';
import 'package:flutter_todoapp/models/Task.dart';
import 'package:flutter_todoapp/providers/TasksProvider.dart';
import 'package:flutter_todoapp/utils/NotificationHelper.dart';
import 'package:provider/provider.dart';

class TaskDialogWidget extends StatefulWidget {
  bool isEditing;
  Task? task;
  String title = '';
  String description = '';

  TaskDialogWidget.create({super.key})
      : isEditing = false,
        task = null;

  TaskDialogWidget.edit({super.key, required Task this.task})
      : isEditing = true,
        title = task.title,
        description = task.description;

  @override
  State<TaskDialogWidget> createState() => _TaskDialogWidgetState();
}

class _TaskDialogWidgetState extends State<TaskDialogWidget> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String? validateTitle(String? value) {
    if (value == null || value.isEmpty) {
      return 'Title is required';
    }
    return null;
  }

  String? validateDescription(String? value) {
    if (value == null || value.isEmpty) {
      return 'Description is required';
    }
    return null;
  }

  void saveChanges(BuildContext context, TasksProvider tasksProvider) {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      if (widget.isEditing) {
        tasksProvider.editTask(
            widget.task!, widget.title, widget.description);
        NotificationHelper.showNotification(
            context, 'Task "${widget.title}" edited successfully!');
      } else {
        Task newTask =
            Task(title: widget.title, description: widget.description);
        tasksProvider.addTask(newTask);
        NotificationHelper.showNotification(
            context, 'Task "${widget.title}" created successfully!');
      }
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<TasksProvider>(builder: (context, tasksProvider, child) {
      return AlertDialog(
        title: Text(widget.isEditing ? 'Edit task' : 'Create task'),
        content: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                initialValue: widget.title,
                onChanged: (newValue) => widget.title = newValue,
                decoration: const InputDecoration(
                  labelText: 'Title',
                  hintText: 'Enter the task title',
                ),
                validator: validateTitle,
              ),
              TextFormField(
                initialValue: widget.description,
                maxLines: null,
                onChanged: (newValue) => widget.description = newValue,
                decoration: const InputDecoration(
                  labelText: 'Description',
                  hintText: 'Enter the task description',
                ),
                validator: validateDescription,
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () => saveChanges(context, tasksProvider),
            child: Text(widget.isEditing ? 'Edit' : 'Create'),
          ),
        ],
      );
    });
  }
}
