import 'package:flutter/material.dart';
import 'package:project_1/controllers/todo_controller.dart';
import 'package:project_1/models/todo.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({ Key key }) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemBuilder: (context, index){ return mockTodos.map((todo) =>_buildItem(todo)).toList();});
  }

  Widget _buildItem(Todo todo){
    return CustomListItem(thumbnail: Container(
            decoration: BoxDecoration(color: TodoController().getColorType(todo.type)),
          ),);
  }
}

class CustomListItem extends StatelessWidget {
  const CustomListItem({
    Key key,
    this.thumbnail,
    this.title,
    this.description,
  }) : super(key: key);

  final Widget thumbnail;
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            flex: 2,
            child: thumbnail,
          ),
          Expanded(
            flex: 3,
            child: ItemDescription(
              title: title,
              description: description,
            ),
          ),
          const Icon(
            Icons.more_vert,
            size: 16.0,
          ),
        ],
      ),
    );
  }
}



class ItemDescription extends StatelessWidget {
  const ItemDescription({
    Key key,
    this.title,
    this.description,
  }) : super(key: key);

  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(5.0, 0.0, 0.0, 0.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 14.0,
            ),
          ),
          const Padding(padding: EdgeInsets.symmetric(vertical: 2.0)),
          Text(
            description,
            style: const TextStyle(fontSize: 10.0),
          ),
        ],
      ),
    );
  }
}