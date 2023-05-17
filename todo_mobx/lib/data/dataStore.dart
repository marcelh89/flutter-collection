import 'package:mobx/mobx.dart';
import 'package:todo_mobx/domain/todo.dart';

// Include generated file
part 'dataStore.g.dart';

// This is the class used by rest of your codebase
class DataStore = _DataStore with _$DataStore;

abstract class _DataStore with Store {
  @observable
  ObservableList<Todo> todos = ObservableList<Todo>();

  @action
  void addTodo(todo) {
    todos.add(todo);
  }

  @action
  void removeTodo(todo) {
    todos.removeWhere((element) => element.id == todo.id);
  }

  @action
  void toggleCompleted(todo){
    todo.completed = !todo.completed;
  }

}