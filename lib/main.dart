import 'package:flutter/material.dart';
import 'package:flutter_todoapp/providers/TasksProvider.dart';
import 'package:flutter_todoapp/views/pages/TasksListPage.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => TasksProvider()),
    ],
    child: const ToDoApp(),
  ));
}

class ToDoApp extends StatelessWidget {
  const ToDoApp({super.key});

  @override
  Widget build(BuildContext context) {
    String title = 'ToDo App';

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: title,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.lime,
          secondary: Colors.blueAccent,
        ),
        useMaterial3: true,
      ),
      home: TasksListPage(),
    );
  }
}
