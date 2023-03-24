import 'package:flutter/material.dart';
import 'package:todoapp/data/todo.repository.dart';
import 'package:todoapp/domain/todo.model.dart';

import 'todolist.widget.dart';

class TodoListState extends State<TodoList> {
  List<Todo> _todoList = <Todo>[];
  TodoRepository todoRepository = TodoRepository();

  final TextEditingController _textFieldController = TextEditingController();

  TodoListState() {
    init();
  }

  init() async {
    await todoRepository.init();
    var initList = await todoRepository.todos();
    setState(() {
      _todoList = initList;
    });
  }

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
      final todo = Todo(DateTime.now().millisecondsSinceEpoch, title);
      todoRepository.insertTodo(todo);
      _todoList.add(todo);
    });
    _textFieldController.clear();
  }

  void _removeTodoItem(int id) {
    setState(() {
      _todoList = _todoList.where((todo) => !identical(todo.id, id)).toList();
      todoRepository.deleteTodo(id);
    });
    _textFieldController.clear();
  }

  List<Widget> _getItems() {
    final List<Widget> _todoWidgets = <Widget>[];
    for (Todo todo in _todoList) {
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
}
