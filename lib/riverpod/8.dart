import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:practicee/riverpod/5.dart' show space;

final numberProvider = StateProvider<List<int>>((_) => [1, 2, 3, 4, 5]);

final sumProvider = Provider(
  (Ref ref) =>
      ref.watch(numberProvider).fold(0, (total, index) => total + index),
);

class RiverpodDerivedStateProvider extends ConsumerWidget {
  const RiverpodDerivedStateProvider({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sum = ref.watch(sumProvider);
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Column(
              children: [
                Text(
                  "Sum is ${sum.toString()}",
                ),
                space,
                ElevatedButton(
                  onPressed: () {
                    final previousSum = ref.read(numberProvider.notifier).state;
                    ref.read(numberProvider.notifier).state = [
                      ...previousSum,
                      previousSum.length + 1
                    ];
                  },
                  child: const Text("Sum"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
