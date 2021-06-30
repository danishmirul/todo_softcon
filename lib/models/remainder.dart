import 'package:intl/intl.dart';
import '../models/todo.dart';

class Remainder extends Todo {
  DateTime dueDate;

  Remainder({String title, String description, this.dueDate})
      : super(title: title, description: description);

  Remainder.copy(Remainder from)
      : this(
          title: from.title,
          description: from.description,
          dueDate: from.dueDate,
        );

  @override
  String toString() =>
      "{\n \ttitle: $title,\n \tdescription: $description,\n \tdueDate: ${DateFormat("dd/MM/yyyy").format(dueDate)},\n}  ";
}
