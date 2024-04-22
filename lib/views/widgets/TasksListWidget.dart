import 'package:flutter/material.dart';
import 'package:flutter_todoapp/models/Task.dart';
import 'package:flutter_todoapp/providers/TasksProvider.dart';
import 'package:flutter_todoapp/views/widgets/TaskWidget.dart';
import 'package:provider/provider.dart';

class TasksListWidget extends StatefulWidget {
  @override
  State<TasksListWidget> createState() => _TasksListWidgetState();
}

class _TasksListWidgetState extends State<TasksListWidget> {
  @override
  Widget build(BuildContext context) {
    return Consumer<TasksProvider>(
      builder: (context, tasksProvider, child) {
        Stream<List<Task>> tasks = tasksProvider.getTasks();

        return StreamBuilder<List<Task>>(
          stream: tasks,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return const Center(
                child: Text('Error loading tasks'),
              );
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            if (snapshot.data!.isEmpty) {
              return const Center(
                child: Text('No tasks found'),
              );
            }

            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                Task task = snapshot.data![index];

                return TaskWidget(
                  task: task,
                );
              },
            );
          },
        );
      },
    );
  }
}
