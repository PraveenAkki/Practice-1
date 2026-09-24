// ignore_for_file: unused_import
import 'package:bloc_demo_app/bloc/counter/counter_bloc.dart';
import 'package:bloc_demo_app/bloc/favoriate_app/favoriate_app_bloc.dart';
import 'package:bloc_demo_app/bloc/image_picker/image_picker_bloc.dart';
import 'package:bloc_demo_app/bloc/posts/post_bloc.dart';
import 'package:bloc_demo_app/bloc/switch_example/switch_bloc.dart';
import 'package:bloc_demo_app/bloc/todo_list/todo_list_bloc.dart';
import 'package:bloc_demo_app/repository/favoriate_repository.dart';
import 'package:bloc_demo_app/repository/post_repository.dart';
import 'package:bloc_demo_app/utils/image_picker_utils.dart';
import 'package:bloc_demo_app/view/favoriate_app_screen.dart';
import 'package:bloc_demo_app/view/image_picker_screen.dart';
import 'package:bloc_demo_app/view/login_screens/login_screen.dart';
import 'package:bloc_demo_app/view/post_screen.dart';
import 'package:bloc_demo_app/view/todo_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_demo_app/view/counter_screen.dart';
import 'package:bloc_demo_app/view/switch_example_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        // BlocProvider(create: (context) => CounterBloc()),

        ///Example for Global BLoC declaration Usage
        BlocProvider(create: (context) => SwitchBloc()),
        BlocProvider(create: (context) => ImagePickerBloc(ImagePickerUtils())),
        BlocProvider(create: (context) => TodoListBloc(),),
        BlocProvider(create: (context) => FavouriteBloc(FavoriateRepository()),),
        BlocProvider(create: (context) => PostBloc(PostRepository()),)
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        themeMode: ThemeMode.dark,
        theme: ThemeData(
          brightness: Brightness.dark,
          useMaterial3: true,
          // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        // home: const CounterScreen(),
        // home: const SwitchExampleScreen(),
        // home: const ImagePickerScreen(),
        // home: TodoListScreen(),
        // home: FavouriteAppScreen(),
        // home: PostScreen(),
        home: LoginScreen()
      ),
    );
  }
}
