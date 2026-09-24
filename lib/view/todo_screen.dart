import 'package:bloc_demo_app/bloc/todo_list/todo_list_bloc.dart';
import 'package:bloc_demo_app/bloc/todo_list/todo_list_event.dart';
import 'package:bloc_demo_app/bloc/todo_list/todo_list_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TodoListScreen extends StatefulWidget {
  const TodoListScreen({super.key});

  @override
  State<TodoListScreen> createState() => _TodoListScreenState();
}

class _TodoListScreenState extends State<TodoListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Todo List App')),
      body: BlocBuilder<TodoListBloc, TodoListState>(
        builder: (context, state) {
          if (state.todosList.isEmpty) {
            return const Center(child: Text('No Todo Items Found!'));
          } else if (state.todosList.isNotEmpty) {
            return ListView.builder(
              itemCount: state.todosList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(state.todosList[index].toString()),
                  trailing: IconButton(
                    onPressed: () {
                      context.read<TodoListBloc>().add(RemoveTodoEvent(task: state.todosList[index]));
                    },
                    icon: Icon(Icons.delete),
                  ),
                );
              },
            );
          } else {
            return const SizedBox();
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          for (int i = 0; i < 20; i++) {
            context.read<TodoListBloc>().add(
              AddTodoEvent(task: 'PraveenSAkki : ' + i.toString()),
            );
          }
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
