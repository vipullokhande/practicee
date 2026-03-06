import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practicee/clean_architecture/presentation/bloc/counter_bloc/counter_bloc.dart';

class BlocCounterScreen extends StatelessWidget {
  const BlocCounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocBuilder<CounterBloc, CounterState>(
          builder: (context, state) {
            if (state is CounterLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state is CounterLoaded) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Value: ${state.counter.value}",
                      style: const TextStyle(fontSize: 30)),
                  const SizedBox(height: 10),
                  Text("Title: ${state.counter.title}"),
                  Text("Completed: ${state.counter.completed}"),
                ],
              );
            }
            if (state is CounterError) {
              return Center(child: Text(state.message));
            }
            return const SizedBox();
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => context.read<CounterBloc>().add(IncrementCounter()),
          child: const Icon(Icons.add),
        ));
  }
}
