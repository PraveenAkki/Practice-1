import 'package:equatable/equatable.dart';

abstract class TodoListEvents extends Equatable {
  const TodoListEvents();

  @override
  List<Object?> get props => [];
}

class AddTodoEvent extends TodoListEvents {

  final String? task;
  const AddTodoEvent({required this.task});

  @override
  List<Object?> get props => [task];
}

class RemoveTodoEvent extends TodoListEvents {
  
  final Object? task;
  const RemoveTodoEvent({required this.task});

  @override
  List<Object?> get props => [task];
}