import '../models/task_description.dart';
import '../models/todo.dart';

class Task extends Todo {
  List<TaskDescription> tasks;

  Task({String title, String description, this.tasks})
      : super(title: title, description: description);

  Task.copy(Task from)
      : this(
            title: from.title,
            description: from.description,
            tasks: from.tasks);

  @override
  String toString() =>
      "{\n \ttitle: $title,\n \tdescription: $description,\n}  ";
}
