import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:task_manager/models/loginModel.dart';
import 'package:task_manager/models/toDoTask.dart';

class HttpService extends StatelessWidget {
  final String baseUrl = 'http://localhost:59872/api/tasks';

  @override
  Widget build(BuildContext context) {
    return Container();
  }

  logIn(LoginModel loginModel) async {
    var loginResult = await http.post(
      Uri.parse(baseUrl),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "username": loginModel.username,
        "password": loginModel.password,
        "isCoverisEmployee": true
      }),
    ).then((response) {
      print(response.body);
      print(response.statusCode);
    });
    // print(loginResult.body);
  }

  Future<List<ToDoTask>> getTasks() async {
    List<ToDoTask> tasks = [];

    try {
      var data = await http.get(Uri.parse(baseUrl));
      print(data.body);
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
