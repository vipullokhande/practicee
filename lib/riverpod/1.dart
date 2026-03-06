import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final counterprovider = StateProvider((Ref ref) {
  return 0;
});

class RiverpodCounterExample extends ConsumerWidget {
  const RiverpodCounterExample({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print("Whole build");
    return Scaffold(
      body: Center(
        child: Consumer(
          builder: (context, ref, child) {
            final counter = ref.watch(counterprovider);
            print("Consumer build");
            return Text(counter.toString());
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        ref.read(counterprovider.notifier).state++;
      }),
    );
  }
}
