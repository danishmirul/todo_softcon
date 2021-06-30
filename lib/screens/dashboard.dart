import 'package:flutter/material.dart';
import '../constants.dart';
import '../controllers/user_controller.dart';
import '../models/note.dart';
import '../models/remainder.dart';
import '../models/task.dart';
import '../controllers/todo_controller.dart';
import '../models/todo.dart';

class Dashboard extends StatelessWidget {
  final List _data;

  Dashboard(this._data);

  @override
  Widget build(BuildContext context) {
    print(_data);
    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        title: Text(
          'TODO SOFTCON',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontFamily: 'OpenSans',
            fontSize: 22,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              UserController().signOut();
              Navigator.pushReplacementNamed(context, homeRoute);
            },
          )
        ],
        centerTitle: true,
      ),
      body: ListView.separated(
        itemCount: _data.length,
        itemBuilder: (context, index) => _ListTile(
          index: index,
          todos: _data,
        ),
        separatorBuilder: (context, index) => Divider(
          color: Colors.grey,
        ),
      ),
    );
  }
}

class _ListTile extends StatefulWidget {
  final int index;
  final List todos;
  _ListTile({this.index, this.todos});

  @override
  __ListTileState createState() => __ListTileState();
}

class __ListTileState extends State<_ListTile> {
  void _navigate() async {
    final result = await Navigator.pushNamed(context, detailsRoute,
        arguments: widget.todos[widget.index] is Note
            ? Note.copy(widget.todos[widget.index])
            : (widget.todos[widget.index] is Task
                ? Task.copy(widget.todos[widget.index])
                : (widget.todos[widget.index] is Remainder
                    ? Remainder.copy(widget.todos[widget.index])
                    : Todo.copy(widget.todos[widget.index]))));

    if (result != null) {
      setState(() => widget.todos[widget.index] = result);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(widget.todos[widget.index].title),
      tileColor: TodoController().getColorType(widget.todos[widget.index]),
      subtitle: Text(widget.todos[widget.index].description),
      onTap: () => _navigate(),
    );
  }
}
