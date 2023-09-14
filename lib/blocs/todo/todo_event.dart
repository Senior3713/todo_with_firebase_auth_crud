part of 'todo_bloc.dart';

abstract class TodoEvent extends Equatable {
  const TodoEvent();

  @override
  List<Object?> get props => [];
}

class AddTodo extends TodoEvent {
  final TodoItem todoItem;
  const AddTodo({required this.todoItem});
}

class EditTodo extends TodoEvent {
  final TodoItem todoItem;
  final String title;
  final String desc;
  const EditTodo({required this.title, required this.desc, required this.todoItem});
}

class RemoveTodo extends TodoEvent {
  final TodoItem todoItem;
  const RemoveTodo({required this.todoItem});
}

class GetAllTodos extends TodoEvent {}


