class Todo {
  String title;
  String description;
  String type;
  DateTime createdAt;

  Todo({this.title, this.description, this.type, DateTime createdAt}){
    if(createdAt == null){
      this.createdAt = DateTime.now();
    }
  }
}

List mockTodos = [
  Todo(title: 'Vagabond Event', description: '5k points every challenge', type: 'TASK')
];