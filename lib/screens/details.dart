import 'package:flutter/material.dart';
import '../models/todo.dart';

class DetailsScreen extends StatefulWidget {
  final Todo _data;
  DetailsScreen(this._data, {Key key}) : super(key: key);

  @override
  _DetailsScreenState createState() => _DetailsScreenState(_data);
}

class _DetailsScreenState extends State<DetailsScreen> {
  Todo _data;
  _DetailsScreenState(this._data);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => Future.value(false),
      child: Scaffold(
        appBar: AppBar(
          leading: Container(),
          title: Text(_data.title),
          centerTitle: true,
        ),
        body: _data.type == 'NOTE'
            ? _buildNote()
            : _data.type == 'TASK'
                ? _buildTask()
                : _buildRemainder(),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            FloatingActionButton.extended(
              label: const Text('Save'),
              icon: const Icon(Icons.check_circle),
              heroTag: null,
              onPressed: () => Navigator.pop(context, _data),
            ),
            FloatingActionButton.extended(
              label: const Text('Cancel'),
              icon: const Icon(Icons.cancel),
              heroTag: null,
              onPressed: () => Navigator.pop(context, null),
            ),
          ],
        ),
      ),
    );
  }

  _buildNote() => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width - 60,
              child: TextFormField(
                key: new Key('title'),
                validator: (value) => value.isEmpty ? 'Cannot be empty' : null,
                onChanged: (value) => _data.title = value.trim(),
                initialValue: _data.title,
                autocorrect: false,
                decoration: InputDecoration(
                    labelText: 'Title',
                    labelStyle: TextStyle(fontFamily: 'OpenSans')),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width - 60,
              child: TextFormField(
                key: new Key('description'),
                validator: (value) => value.isEmpty ? 'Cannot be empty' : null,
                onChanged: (value) => _data.note = value.trim(),
                initialValue: _data.description,
                autocorrect: false,
                decoration: InputDecoration(
                    labelText: 'Description',
                    labelStyle: TextStyle(fontFamily: 'OpenSans')),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width - 60,
              child: TextFormField(
                key: new Key('note'),
                validator: (value) => value.isEmpty ? 'Cannot be empty' : null,
                onChanged: (value) => _data.note = value.trim(),
                initialValue: _data.note,
                autocorrect: false,
                maxLines: 10,
                decoration: InputDecoration(
                    labelText: 'Note',
                    labelStyle: TextStyle(fontFamily: 'OpenSans')),
              ),
            ),
          ],
        ),
      );

  _buildRemainder() => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width - 60,
              child: TextFormField(
                key: new Key('title'),
                validator: (value) => value.isEmpty ? 'Cannot be empty' : null,
                onChanged: (value) => _data.title = value.trim(),
                initialValue: _data.title,
                autocorrect: false,
                decoration: InputDecoration(
                    labelText: 'Title',
                    labelStyle: TextStyle(fontFamily: 'OpenSans')),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width - 60,
              child: TextFormField(
                key: new Key('description'),
                validator: (value) => value.isEmpty ? 'Cannot be empty' : null,
                onChanged: (value) => _data.note = value.trim(),
                initialValue: _data.description,
                autocorrect: false,
                decoration: InputDecoration(
                    labelText: 'Description',
                    labelStyle: TextStyle(fontFamily: 'OpenSans')),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width - 60,
              child: InputDatePickerFormField(
                initialDate: _data.duedate,
                firstDate: DateTime.now(),
                lastDate: DateTime(DateTime.now().year + 1,
                    DateTime.now().month, DateTime.now().day),
              ),
            ),
          ],
        ),
      );

  _buildTask() => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width - 60,
              child: TextFormField(
                key: new Key('title'),
                validator: (value) => value.isEmpty ? 'Cannot be empty' : null,
                onChanged: (value) => _data.title = value.trim(),
                initialValue: _data.title,
                autocorrect: false,
                decoration: InputDecoration(
                    labelText: 'Title',
                    labelStyle: TextStyle(fontFamily: 'OpenSans')),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width - 60,
              child: TextFormField(
                key: new Key('description'),
                validator: (value) => value.isEmpty ? 'Cannot be empty' : null,
                onChanged: (value) => _data.note = value.trim(),
                initialValue: _data.description,
                autocorrect: false,
                decoration: InputDecoration(
                    labelText: 'Description',
                    labelStyle: TextStyle(fontFamily: 'OpenSans')),
              ),
            ),
            SizedBox(
              height: 300,
              child: ListView.separated(
                itemCount: _data.tasks.length,
                itemBuilder: (context, index) => ListTile(
                  title: Text(_data.tasks[index].title),
                  subtitle: Text(_data.tasks[index].description),
                  trailing: DropdownButton<bool>(
                    value: _data.tasks[index].done,
                    items: [
                      DropdownMenuItem(
                        value: true,
                        child: Text('Complete'),
                      ),
                      DropdownMenuItem(
                        value: false,
                        child: Text('In Progress'),
                      ),
                    ],
                    onChanged: (newValue) =>
                        setState(() => _data.tasks[index].done = newValue),
                  ),
                ),
                separatorBuilder: (context, index) => Divider(
                  color: Colors.grey,
                ),
              ),
            )
          ],
        ),
      );
}
