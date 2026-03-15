import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TimerService {
  Stream<int> tickWithError() async* {
    for (var i = 0; i < 5; i++) {
      await Future.delayed(const Duration(seconds: 1));
      yield i;
    }
    throw Exception("Error occured");
  }
}

final tickServiceProvider = Provider((_) => TimerService());

final tickerProvider = StreamProvider(
  (Ref ref) => ref.read(tickServiceProvider).tickWithError(),
);

class RiverpodStreamExample extends ConsumerWidget {
  const RiverpodStreamExample({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ticker = ref.watch(tickerProvider);
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: ticker.when(
            skipLoadingOnRefresh: false, // By default it is true
            data: (data) => Text("Data ${data.toString()}"),
            error: (error, _) {
              return Column(
                children: [
                  Text("Error ${error.toString()}"),
                  const SizedBox(
                    height: 10,
                  ),
                  TextButton(
                    onPressed: () => ref.refresh(tickerProvider),
                    child: const Text(
                      "Refresh",
                    ),
                  ),
                ],
              );
            },
            loading: () => const Center(
              child: CircularProgressIndicator(),
            ),
          ),
        ),
      ],
    ));
  }
}
