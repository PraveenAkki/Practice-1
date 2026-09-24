import 'package:bloc_demo_app/bloc/todo_list/todo_list_event.dart';
import 'package:bloc_demo_app/bloc/todo_list/todo_list_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TodoListBloc extends Bloc<TodoListEvents, TodoListState>{

  final List<String> todosList = [];
  TodoListBloc() : super(const TodoListState()){

    on<AddTodoEvent>((AddTodoEvent event, Emitter<TodoListState> emit) {
      if (event.task != null) {
        todosList.add(event.task!);
        emit(state.copyWith(todosList: List.from(todosList)));
      }
    },);

    on<RemoveTodoEvent>((RemoveTodoEvent event, Emitter<TodoListState> emit) {
      if (event.task != null) {
        todosList.remove(event.task!);
        emit(state.copyWith(todosList: List.from(todosList)));
      }
    },);
    
  }

}