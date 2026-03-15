import 'dart:math';
import 'package:flutter/material.dart';
import 'package:practicee/provider_example/providers/counter_provider.dart';
import 'package:provider/provider.dart';

class CounterProviderScreen extends StatefulWidget {
  const CounterProviderScreen({super.key});

  @override
  State<CounterProviderScreen> createState() => _CounterProviderScreenState();
}

class _CounterProviderScreenState extends State<CounterProviderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(
            height: 100,
          ),
          Selector<CounterProviderExample, int>(
            selector: (context, provider) => provider.age,
            builder: (context, age, child) {
              print("Age build called");
              return Text(age.toString());
            },
          ),
          Selector<CounterProviderExample, String>(
            selector: (context, provider) => provider.name,
            builder: (context, name, child) {
              print("Name build called");
              return Text(name);
            },
          ),
          ElevatedButton(
            onPressed: () => context
                .read<CounterProviderExample>()
                .changeName("Name ${Random().nextInt(10000)}"),
            child: const Text("Change Name"),
          ),
          ElevatedButton(
            onPressed: () => context
                .read<CounterProviderExample>()
                .changeAge(Random().nextInt(10000)),
            child: const Text("Change Age"),
          ),
        ],
      ),
    );
  }
}
