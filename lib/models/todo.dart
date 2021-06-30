import 'package:flutter/material.dart';
import '../models/note.dart';
import '../models/remainder.dart';
import '../models/task.dart';
import '../models/task_description.dart';

class Todo {
  String title;
  String description;

  Todo({this.title, this.description});

  Todo.copy(Todo from) : this(title: from.title, description: from.description);

  @override
  String toString() =>
      "{\n \ttitle: $title,\n \tdescription: $description,\n}  ";

  Color getColorType(Todo param) {
    if (param is Note) {
      return Colors.lime;
    } else if (param is Task) {
      return Colors.indigo;
    } else if (param is Remainder) {
      if (param.dueDate.millisecond >= DateTime.now().millisecond)
        return Colors.orange;
      return Colors.green;
    } else
      return Colors.white;
  }
}

List mockTodos = [
  Note(
    title: 'Vagabond Event',
    description: 'Points target',
    notes: '5k points every challenge',
  ),
  Task(
    title: 'Belom Anjir Event',
    description: 'kerja apakah',
    tasks: [
      TaskDescription('Awek', 'Jumpa Awek', false),
    ],
  ),
  Remainder(
    title: 'Due Date',
    description: 'Ending',
    dueDate: DateTime.now(),
  ),
];
