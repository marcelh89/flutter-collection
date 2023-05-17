import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../state/todo_list.dart';
import 'action_bar.dart';
import 'add_todo.dart';
import 'description.dart';
import 'todo_list_view.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Provider<TodoList>(
      create: (_) => TodoList(),
      child: Scaffold(
          appBar: AppBar(
            title: const Text('Todos'),
          ),
          body: Column(
            children: <Widget>[
              AddTodo(),
              ActionBar(),
              Description(),
              TodoListView()
            ],
          )));
}
