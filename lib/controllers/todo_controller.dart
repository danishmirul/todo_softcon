import 'package:flutter/material.dart';
import '../models/todo.dart';
import '../models/user.dart';

class TodoController {
  Color getColorType(Todo param) {
    switch (param.type) {
      case 'TASK':
        return Colors.indigo;
        break;
      case 'REMAINDER':
        if (param.duedate.millisecond >= DateTime.now().millisecond)
          return Colors.orange;
        return Colors.green;
        break;
      case 'NOTE':
        return Colors.lime;
        break;
      default:
        return Colors.red;
    }
  }
}
