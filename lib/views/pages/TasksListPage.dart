import 'package:flutter/material.dart';
import 'package:flutter_todoapp/views/widgets/AppBarWidget.dart';
import 'package:flutter_todoapp/views/widgets/TaskDialogWidget.dart';
import 'package:flutter_todoapp/views/widgets/TasksListWidget.dart';

class TasksListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: AppBarWidget(title: 'ToDo App'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: TasksListWidget(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return TaskDialogWidget.create();
            },
          ); 
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
