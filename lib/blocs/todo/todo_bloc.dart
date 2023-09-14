import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:todo_with_firebase_auth/main.dart';
import 'package:todo_with_firebase_auth/models/todo_item.dart';
import 'package:todo_with_firebase_auth/models/todo_model.dart';

part 'todo_event.dart';

part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  TodoBloc() : super(TodoInitial(todo: TodoModel(id: 0, todos: []))) {
    on<AddTodo>(_addTodo);
    on<EditTodo>(_editTodo);
    on<RemoveTodo>(_removeTodo);
    on<GetAllTodos>(_getAllTodos);
  }

  void _addTodo(AddTodo event, Emitter emit) async {
    emit(TodoLoading(todo: state.todo));

    List<TodoItem> listItems = state.todo.todos;

    final todoList = [...listItems, event.todoItem];

    await sql.addTodo(event.todoItem);

    emit(
      TodoSuccess(
        todo: TodoModel(id: todoList.length, todos: todoList),
      ),
    );
  }

  void _editTodo(EditTodo event, Emitter emit) {
    emit(TodoLoading(todo: state.todo));

    event.todoItem.title = event.title;
    event.todoItem.desc = event.desc;

    sql.editTodo(event.todoItem);

    emit(
      TodoSuccess(
        todo: TodoModel(id: state.todo.todos.length, todos: state.todo.todos),
      ),
    );
  }

  void _removeTodo(RemoveTodo event, Emitter emit) async {
    emit(TodoLoading(todo: state.todo));

    List<TodoItem> listItems = state.todo.todos;
    listItems.remove(event.todoItem);
    debugPrint(event.todoItem.toString());

    await sql.removeTodo(event.todoItem);

    final result = [...listItems];

    emit(TodoSuccess(todo: TodoModel(id: result.length, todos: result)));
  }

  void _getAllTodos(GetAllTodos event, Emitter emit) async {
    emit(TodoLoading(todo: state.todo));

    final todos = await sql.todos();

    emit(
      TodoSuccess(
        todo: TodoModel(id: todos.length, todos: todos),
      ),
    );
  }
}
