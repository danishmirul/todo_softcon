class TaskDescription {
  String title;
  String description;
  bool done;

  TaskDescription(this.title, this.description, this.done);
  TaskDescription.copy(TaskDescription from)
      : this(from.title, from.description, from.done);
}
