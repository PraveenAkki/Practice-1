import 'package:equatable/equatable.dart';

class TodoListState extends Equatable {

  final List<String> todosList;
  const TodoListState({this.todosList = const []});

  TodoListState copyWith({List<String>? todosList}){
    return TodoListState(
      todosList: todosList ?? this.todosList
    );
  }

  @override
  List<Object?> get props => [todosList];

}