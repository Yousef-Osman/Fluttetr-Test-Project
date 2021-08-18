import 'package:flutter/foundation.dart';

class ToDoTask {
  final int id;
  final String body;
  final String date;
  final bool isDone;

  ToDoTask({
    this.id,
    @required this.body,
    @required this.date,
    @required this.isDone,
  });

  factory ToDoTask.fromJson(json) {
    return ToDoTask(
      id: json['id'],
      body: json['body'],
      date: json['date'],
      isDone: json['isDone'],
    );
  }
}
