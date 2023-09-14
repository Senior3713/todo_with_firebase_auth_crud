import 'package:todo_with_firebase_auth/models/todo_item.dart';

class TodoModel {
  int id;
  List<TodoItem> todos;

  TodoModel({
    required this.id,
    required this.todos,
  });

  @override
  String toString() {
    return "Todo{id: $id, todos: $todos}";
  }

  factory TodoModel.fromJson(Map<String, Object?> json) =>
      TodoModel(id: json["id"] as int, todos: json["todos"] as List<TodoItem>);

  Map<String, Object?> toJson() => {
    "id": id,
    "todos": todos,
  };
}
