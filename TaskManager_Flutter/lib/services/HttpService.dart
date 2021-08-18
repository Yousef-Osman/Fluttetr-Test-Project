import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:task_manager/models/toDoTask.dart';

class HttpService extends StatelessWidget {
  final String baseUrl = 'http://localhost/api/tasks';

  @override
  Widget build(BuildContext context) {
    return Container();
  }

  Future<List<ToDoTask>> getTasks() async {
    List<ToDoTask> tasks = [];

    try {
      var data = await http.get(Uri.parse(baseUrl));
      var jsonData = json.decode(data.body);

      for (var jsonPost in jsonData) {
        print(jsonPost);
        var task = ToDoTask.fromJson(jsonPost);
        tasks.add(task);
      }
    } catch (e) {
      return tasks;
    }

    return tasks;
  }
}