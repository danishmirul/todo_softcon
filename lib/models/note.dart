import '../models/todo.dart';

class Note extends Todo {
  String notes;

  Note({String title, String description, this.notes})
      : super(title: title, description: description);

  Note.copy(Note from)
      : this(
          title: from.title,
          description: from.description,
          notes: from.notes,
        );

  @override
  String toString() =>
      "{\n \ttitle: $title,\n \tdescription: $description,\n \tnotes: $notes,\n}  ";
}
