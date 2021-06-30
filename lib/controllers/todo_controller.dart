import 'package:flutter/material.dart';
import '../models/note.dart';
import '../models/remainder.dart';
import '../models/task.dart';

class TodoController {
  Color getColorType(param) {
    if (param is Task) {
      return Colors.indigo;
    } else if (param is Remainder) {
      if (param.dueDate.millisecond >= DateTime.now().millisecond)
        return Colors.orange;
      return Colors.green;
    } else if (param is Note) {
      return Colors.lime;
    } else {
      return Colors.white;
    }
  }
}
