import 'package:bloc_demo_app/bloc/counter/counter_bloc.dart';
import 'package:bloc_demo_app/bloc/counter/counter_events.dart';
import 'package:bloc_demo_app/bloc/counter/counter_state.dart';
import 'package:bloc_demo_app/view/post_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {

  ///Example for local BLoC declaration Usage
  late CounterBloc _counterBloc;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _counterBloc = CounterBloc();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _counterBloc.close();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return BlocProvider(create:
        (context) => _counterBloc,
      child: Scaffold(
        appBar: AppBar(title: Text('Counter App'), centerTitle: true),
        backgroundColor: Colors.cyanAccent,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => PostScreen(),));
            }, child: Text("Next")),
            SizedBox(height: 20,),
            BlocBuilder<CounterBloc, CounterState>(
              builder: (BuildContext context, CounterState state) {
                return Center(
                  child: Text(
                    state.counter.toString(),
                    style: TextStyle(fontSize: 60, color: Colors.black),
                  ),
                );
              },
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                BlocBuilder<CounterBloc, CounterState>(
                  buildWhen: (previous, current) => false, ///doesn't build with state
                  builder: (context, state) {
                  return ElevatedButton(onPressed: () {
                    context.read<CounterBloc>().add(IncrementCounter());
                  }, child: Text('Increment'));
                },),
                SizedBox(width: 20),
                BlocBuilder<CounterBloc, CounterState>(
                  buildWhen: (previous, current) => false, ///doesn't build with state
                  builder: (context, state) {
                    return ElevatedButton(onPressed: () {
                      context.read<CounterBloc>().add(DecrementCounter());
                    }, child: Text('Decrement'));
                  },
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
