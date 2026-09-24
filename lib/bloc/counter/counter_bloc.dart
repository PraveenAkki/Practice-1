import 'package:bloc/bloc.dart';
import 'package:bloc_demo_app/bloc/counter/counter_events.dart';
import 'package:bloc_demo_app/bloc/counter/counter_state.dart';

class CounterBloc extends Bloc<CounterEvents, CounterState> {

  CounterBloc() : super(const CounterState()) {

    on<IncrementCounter>((IncrementCounter event, Emitter<CounterState> emit) => emit(state.copyWith(counter: state.counter + 1)),);

    on<DecrementCounter>(_decrement);
    
  }

  void _decrement(DecrementCounter event, Emitter<CounterState> emit){
    emit(state.copyWith(counter: state.counter - 1));
  }

}
