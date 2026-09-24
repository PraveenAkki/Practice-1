import 'package:bloc_demo_app/bloc/switch_example/switch_events.dart';
import 'package:bloc_demo_app/bloc/switch_example/switch_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SwitchBloc extends Bloc<SwitchEvents, SwitchState> {

  SwitchBloc() : super(SwitchState()) {
    on<EnableOrDisableNotification>(_enableOrdisableNotification);
    on<SliderEvent>(_sliderOpacityChanges);
  }
  
  void _enableOrdisableNotification(EnableOrDisableNotification event, Emitter<SwitchState> emit){
    emit(state.copyWith(isSwitch: !state.isSwitch));
  }

  void _sliderOpacityChanges(SliderEvent event, Emitter<SwitchState> emit){
    emit(state.copyWith(slider: event.slider));
  }
}
