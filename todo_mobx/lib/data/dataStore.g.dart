// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dataStore.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$DataStore on _DataStore, Store {
  late final _$todosAtom = Atom(name: '_DataStore.todos', context: context);

  @override
  ObservableList<Todo> get todos {
    _$todosAtom.reportRead();
    return super.todos;
  }

  @override
  set todos(ObservableList<Todo> value) {
    _$todosAtom.reportWrite(value, super.todos, () {
      super.todos = value;
    });
  }

  late final _$_DataStoreActionController =
      ActionController(name: '_DataStore', context: context);

  @override
  void addTodo(dynamic todo) {
    final _$actionInfo =
        _$_DataStoreActionController.startAction(name: '_DataStore.addTodo');
    try {
      return super.addTodo(todo);
    } finally {
      _$_DataStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeTodo(dynamic todo) {
    final _$actionInfo =
        _$_DataStoreActionController.startAction(name: '_DataStore.removeTodo');
    try {
      return super.removeTodo(todo);
    } finally {
      _$_DataStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void toggleCompleted(dynamic todo) {
    final _$actionInfo = _$_DataStoreActionController.startAction(
        name: '_DataStore.toggleCompleted');
    try {
      return super.toggleCompleted(todo);
    } finally {
      _$_DataStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
todos: ${todos}
    ''';
  }
}
