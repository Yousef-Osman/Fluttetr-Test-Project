import 'package:flutter/material.dart';
import 'package:task_manager/screens/loginScreen.dart';
// import 'package:task_manager/screens/homeScreen.dart';
import 'package:task_manager/screens/tasksScreen.dart';

void main() {
  runApp(TaskManager());
}

class TaskManager extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Task Manager',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      // home: TasksScreen(),
      home: LoginScreen(),
    );
  }
}