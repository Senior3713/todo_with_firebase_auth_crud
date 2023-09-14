import 'package:sqflite/sqflite.dart';
import 'package:todo_with_firebase_auth/models/todo_item.dart';

const String tableTodo = "TODO";

class SqlService {
  late Database db;

  Future<void> open(String path) async {
    db = await openDatabase(path, version: 5);

    await db.execute('''
create table if not exists TODO ( 
  id integer primary key autoincrement,
  title text not null,
  desc text not null)
''');
  }

  Future<TodoItem> addTodo(TodoItem todo) async {
    todo.id = await db.insert(tableTodo, todo.toJson()..remove("id"), conflictAlgorithm: ConflictAlgorithm.replace);
    return todo;
  }

  Future<int> removeTodo(TodoItem todo) async {
    return await db.delete(tableTodo, where: 'id = ?', whereArgs: [todo.id]);
  }

  Future<int> editTodo(TodoItem todo) async {
    return await db.update(tableTodo, todo.toJson(), where: 'id = ?', whereArgs: [todo.id]);
  }

  Future<List<TodoItem>> todos() async {
    List<Map> maps = await db.query(tableTodo);
    return maps.map((json) => TodoItem.fromJson(Map<String, Object>.from(json))).toList();
  }
}