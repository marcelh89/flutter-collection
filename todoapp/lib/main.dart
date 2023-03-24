import 'package:flutter/material.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'To-Do-List', home: TodoList());
  }
}

class TodoList extends StatefulWidget {
  @override
  _TodoListState createState() => _TodoListState();
}

class Todo {
  int id;
  String title;
  Todo(this.id, this.title);
}

class _TodoListState extends State<TodoList> {
  List<Todo> _todoList = <Todo>[];
  final TextEditingController _textFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('To-Do List'),
      ),
      body: ListView(children: _getItems()),
      floatingActionButton: FloatingActionButton(
        key: const Key('add'),
        onPressed: () => _displayDialog(context),
        tooltip: 'Add Item',
        child: const Icon(Icons.add),
      ),
    );
  }

  void _addTodoItem(String title) {
    //Wrapping it inside a set state will notify
    // the app that the state has changed

    setState(() {
      _todoList.add(Todo(new DateTime.now().millisecondsSinceEpoch, title));
    });
    _textFieldController.clear();
  }

  void _removeTodoItem(int id) {
    setState(() {
      _todoList = _todoList.where((todo) => !identical(todo.id, id)).toList();
    });
    _textFieldController.clear();
  }

  //Generate list of item widgets
  Widget _buildTodoItem(Todo todo, BuildContext context) {
    return ListTile(
      title: Text(todo.title),
      onTap: () => _displayDeleteDialog(context, todo),
    );
  }

  //Generate a single item widget
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
                  //print(context);
                  _removeTodoItem(todo.id);
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

  //Generate a single item widget
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
                  _addTodoItem(_textFieldController.text);
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

  List<Widget> _getItems() {
    final List<Widget> _todoWidgets = <Widget>[];
    for (Todo todo in _todoList) {
      _todoWidgets.add(_buildTodoItem(todo, context));
    }
    return _todoWidgets;
  }
}
