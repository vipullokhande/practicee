import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final counterProvider = StateNotifierProvider<CounterProvider, int>((_) {
  return CounterProvider(0);
});

class CounterProvider extends StateNotifier<int> {
  CounterProvider(super.state);
  increment() => state++;
  decrement() => state--;
  reset() => state = 0;
}

const space = SizedBox(height: 10);

class RiverpodIntStateNotifierProviderExample extends ConsumerWidget {
  const RiverpodIntStateNotifierProviderExample({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final counter = ref.watch(counterProvider);
    final counterControl = ref.read(counterProvider.notifier);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(counter.toString()),
            space,
            ElevatedButton(
              onPressed: () => counterControl.increment(),
              child: const Text("Increment"),
            ),
            space,
            ElevatedButton(
              onPressed: () => counterControl.decrement(),
              child: const Text("Decrement"),
            ),
            space,
            ElevatedButton(
              onPressed: () => counterControl.reset(),
              child: const Text("Reset"),
            ),
          ],
        ),
      ),
    );
  }
}
