import 'package:equatable/equatable.dart';

abstract class CounterEvents extends Equatable {

  const CounterEvents();

  @override
  List<Object> get props => [];

}


class IncrementCounter extends CounterEvents {
  const IncrementCounter();
}

class DecrementCounter extends CounterEvents {
  const DecrementCounter();
}