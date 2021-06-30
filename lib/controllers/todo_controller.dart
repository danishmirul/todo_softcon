import 'package:flutter/material.dart';
import 'package:project_1/models/user.dart';

class TodoController {
  Color getColorType(String param) {
    switch (param) {
      case 'TASK':
        return Colors.indigo;
        break;
      case 'REMAINDER':
        return Colors.amber;
        break;
      case 'NOTE':
        return Colors.yellow;
        break;
      default:
        return Colors.red;
    }
  }
}