import 'package:bloc_demo_app/bloc/switch_example/switch_bloc.dart';
import 'package:bloc_demo_app/bloc/switch_example/switch_events.dart';
import 'package:bloc_demo_app/bloc/switch_example/switch_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SwitchExampleScreen extends StatefulWidget {
  const SwitchExampleScreen({super.key});

  @override
  State<SwitchExampleScreen> createState() => _SwitchExampleScreenState();
}

class _SwitchExampleScreenState extends State<SwitchExampleScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Switch Screen')),
      body: Padding(
        padding: const EdgeInsetsGeometry.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Notifications'),
                BlocBuilder<SwitchBloc, SwitchState>(
                  buildWhen: (previous, current) =>
                      previous.isSwitch != current.isSwitch,
                  builder: (context, state) {
                    return Switch(
                      value: state.isSwitch,
                      onChanged: (newValue) {
                        context.read<SwitchBloc>().add(
                          EnableOrDisableNotification(),
                        );
                      },
                    );
                  },
                ),
              ],
            ),
            const SizedBox(height: 30),
            BlocBuilder<SwitchBloc, SwitchState>(
              buildWhen: (previous, current) =>
                  previous.slider != current.slider,
              builder: (context, state) {
                return Container(
                  height: 200,
                  width: double.infinity,
                  color: Colors.red.withOpacity(state.slider),
                );
              },
            ),
            const SizedBox(height: 50),
            BlocBuilder<SwitchBloc, SwitchState>(
              buildWhen: (previous, current) => previous.slider != current.slider,
              builder: (context, state) {
                return Slider(
                  value: state.slider,
                  onChanged: (onChanged) {
                    context.read<SwitchBloc>().add(
                      SliderEvent(slider: onChanged)
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
