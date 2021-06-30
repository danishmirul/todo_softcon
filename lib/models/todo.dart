import '../models/task_description.dart';

class Todo {
  String title;
  String description;
  String type;
  String note;
  List<TaskDescription> tasks;
  DateTime duedate;

  Todo(
      {this.title,
      this.description,
      this.type,
      this.note,
      this.tasks,
      this.duedate});

  Todo.copy(Todo from)
      : this(
            title: from.title,
            description: from.description,
            type: from.type,
            note: from.note,
            tasks: from.tasks,
            duedate: from.duedate);

  @override
  String toString() =>
      "{\n \ttitle: $title,\n \tdescription: $description,\n \ttype: $type,\n \tnote: $note,\n \tduedate:$duedate\n}  ";
}

List mockTodos = [
  Todo(
    title: 'Vagabond Event',
    description: 'Points target',
    note: '5k points every challenge',
    type: 'NOTE',
  ),
  Todo(
    title: 'Belom Anjir Event',
    description: 'kerja apakah',
    type: 'TASK',
    tasks: [
      TaskDescription('Awek', 'Jumpa Awek', false),
    ],
  ),
  Todo(
    title: 'Due Date',
    description: 'Ending',
    type: 'REMAINDER',
    duedate: DateTime.now(),
  ),
];
