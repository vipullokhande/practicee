import 'package:flutter/material.dart';
import 'package:practicee/bloc/counter_bloc_1/counter_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterScreen extends StatelessWidget {
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text("Even number counter"),
          Center(
            child: BlocConsumer<CounterBloc, CounterState>(
              listenWhen: (_, current) => current is CounterUpdated,
              listener: (context, state) {
                if (state is CounterUpdated) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Counter update complete")),
                  );
                }
              },
              buildWhen: (_, current) =>
                  current is CounterLoading ||
                  current is CounterEven ||
                  current is CounterUpdated,
              builder: (context, state) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (state is CounterLoading)
                      const Center(child: CircularProgressIndicator()),
                    if (state is CounterInitial)
                      Text(
                        state.counter.toString(),
                        style:
                            const TextStyle(fontSize: 40, color: Colors.blue),
                      ),
                    if (state is CounterEven)
                      Text(
                        state.counter.toString(),
                        style:
                            const TextStyle(fontSize: 40, color: Colors.blue),
                      ),
                    if (state is CounterUpdated)
                      Text(
                        state.previousEven.toString(),
                        style:
                            const TextStyle(fontSize: 40, color: Colors.blue),
                      ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: state is CounterLoading
                          ? null
                          : () {
                              context.read<CounterBloc>().add(IncrementEvent());
                            },
                      child: const Text("Add"),
                    ),
                    ElevatedButton(
                      onPressed: state is CounterLoading
                          ? null
                          : () {
                              context.read<CounterBloc>().add(DecrementEvent());
                            },
                      child: const Text("Subtract"),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
