import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../domain/todo.model.dart';

class TodoRepository {
  late String fileName;
  late Future<Database> database;

  //TodoRepository([this.fileName = "database.db"]);
  TodoRepository() {
    fileName = "database.db";
  }

  init() async {
    WidgetsFlutterBinding.ensureInitialized();
    database = openDatabase(
      // Set the path to the database. Note: Using the `join` function from the
      // `path` package is best practice to ensure the path is correctly
      // constructed for each platform.
      join(await getDatabasesPath(), fileName),
      // When the database is first created, create a table to store todos.
      onCreate: (db, version) {
        // Run the CREATE TABLE statement on the database.
        return db.execute(
          'CREATE TABLE todos(id INTEGER PRIMARY KEY, title TEXT)',
        );
      },
      // Set the version. This executes the onCreate function and provides a
      // path to perform database upgrades and downgrades.
      version: 1,
    );
  }

  Future<List<Todo>> todos() async {
    // Get a reference to the database.
    final db = await database;

    // Query the table for all The Todos.
    final List<Map<String, dynamic>> maps = await db.query('todos');

    // Convert the List<Map<String, dynamic> into a List<Dog>.
    return List.generate(maps.length, (i) {
      return Todo(
        maps[i]['id'],
        maps[i]['title'],
      );
    });
  }

// Define a function that inserts Todos into the database
  Future<void> insertTodo(Todo todo) async {
    // Get a reference to the database.
    final db = await database;

    // Insert the Dog into the correct table. You might also specify the
    // `conflictAlgorithm` to use in case the same dog is inserted twice.
    //
    // In this case, replace any previous data.
    await db.insert(
      'todos',
      todo.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );

    print(await todos());
  }

  Future<void> deleteTodo(int id) async {
    // Get a reference to the database.
    final db = await database;

    // Remove the Dog from the database.
    await db.delete(
      'todos',
      // Use a `where` clause to delete a specific dog.
      where: 'id = ?',
      // Pass the Dog's id as a whereArg to prevent SQL injection.
      whereArgs: [id],
    );

    print(await todos());
  }

  Future<void> deleteAllTodos() async {
    // Get a reference to the database.
    final db = await database;

    // Remove the Dog from the database.
    await db.delete(
      'todos',
    );

    print(await todos());
  }
}
