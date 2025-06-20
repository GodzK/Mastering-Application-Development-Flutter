import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'TodoItem.dart';

class TodoProvider {
  static const todoTable = "TodoItemTable";
  static TodoProvider instance = TodoProvider();

  Future<Database> database() async {
    return openDatabase(
      join(await getDatabasesPath(), 'todo_item.db'),
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE $todoTable (
            id TEXT PRIMARY KEY,
            title TEXT,
            notes TEXT,
            done INTEGER
          )
        ''');
      },
    );
  }

  Future<List<TodoItem>> fetchTodos() async {
    Database db = await database();
    final todos = await db.query(todoTable);
    return todos.map((e) => TodoItem.fromMap(e)).toList();
  }

  Future<void> insertTodo(TodoItem item) async {
    Database db = await database();
    await db.insert(
      todoTable,
      item.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }
  Future<void> updateTodo(TodoItem item) async {
    Database db = await database();
    await db.update(todoTable, item.toMap(),
    where: 'id = ?',
    whereArgs: [item.id],
    conflictAlgorithm: ConflictAlgorithm.replace);
  }
  Future<void> deleteTodo(TodoItem item) async {
    Database db = await database();
    await db.delete(todoTable, where: 'id = ?', whereArgs: [item.id] );
  }
}
