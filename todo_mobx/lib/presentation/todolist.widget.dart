import 'package:flutter/material.dart';
import 'package:todo_mobx/main.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../domain/todo.dart';



class TodoList extends StatelessWidget {

  final TextEditingController _textFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) => Scaffold(
      appBar: AppBar(
        title: const Text('To-Do List'),
      ),
      body: ListView(
        children: _getItems(context)),
      floatingActionButton: FloatingActionButton(
        key: const Key('add'),
        onPressed: () => _displayDialog(context),
        tooltip: 'Add Item',
        child: const Icon(Icons.add),
      ),
    ));
  }

  List<Widget> _getItems(BuildContext context) {
    final List<Widget> _todoWidgets = <Widget>[];
    for (Todo todo in dataStore.todos) {
      _todoWidgets.add(_buildTodoItem(todo, context));
    }
    return _todoWidgets;
  }

    //Generate list of item widgets
  Widget _buildTodoItem(Todo todo, BuildContext context) {
    return ListTile(
      title: Text(todo.title),
      onTap: () => _displayDeleteDialog(context, todo),
    );
  }

  Future<dynamic> _displayDialog(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Add a task to your List'),
            content: TextField(
              controller: _textFieldController,
              decoration: const InputDecoration(hintText: 'Enter task here'),
            ),
            actions: <Widget>[
              TextButton(
                child: const Text('ADD'),
                onPressed: () {
                  Navigator.of(context).pop();
                  dataStore.addTodo(Todo(DateTime.now().millisecondsSinceEpoch, _textFieldController.text ));
                  _textFieldController.clear();
                },
              ),
              TextButton(
                child: const Text('CANCEL'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }
  
  Future<dynamic> _displayDeleteDialog(BuildContext context, Todo todo) async {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Remove todo'),
            actions: <Widget>[
              TextButton(
                child: const Text('REMOVE'),
                onPressed: () {
                  Navigator.of(context).pop();
                  dataStore.removeTodo(todo);
                },
              ),
              TextButton(
                child: const Text('CANCEL'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }

}