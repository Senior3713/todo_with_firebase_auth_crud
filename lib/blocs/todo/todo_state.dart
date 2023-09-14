part of 'todo_bloc.dart';

abstract class TodoState extends Equatable {
  final TodoModel todo;
  const TodoState({required this.todo});

  @override
  List<Object> get props => [todo];
}

class TodoInitial extends TodoState {
  const TodoInitial({required super.todo});
}

class TodoLoading extends TodoState {
  const TodoLoading({required super.todo});
}

class TodoFailure extends TodoState {
  const TodoFailure({required super.todo});
}

class TodoSuccess extends TodoState {
  const TodoSuccess({required super.todo});
}
