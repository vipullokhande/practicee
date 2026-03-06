import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FakeService {
  Future<String> getGreeting() async {
    await Future.delayed(const Duration(seconds: 2));
    if (Random().nextDouble() < 0.3) {
      throw Exception("Not found");
    }
    return 'Hello World';
  }
}

//Singleton Provider
final fakeServiceProvider = Provider((_) => FakeService());

//Future Provider
final greetingTextFutureProvider = FutureProvider((Ref ref) async {
  return await ref.read(fakeServiceProvider).getGreeting();
});

class RiverpodFutureExample extends ConsumerWidget {
  const RiverpodFutureExample({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final greeting = ref.watch(greetingTextFutureProvider);
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: greeting.when(
              skipLoadingOnRefresh: false,
              data: (data) => Text(data),
              error: (error, stackTrace) {
                // showAlertDialog(context);
                // ScaffoldMessenger.of(context).showSnackBar(
                //   SnackBar(
                //     content: Text(
                //       error.toString(),
                //     ),
                //   ),
                // );
                return Column(
                  children: [
                    Text("Error ${error.toString()}"),
                    const SizedBox(
                      height: 10,
                    ),
                    TextButton(
                      onPressed: () => ref.refresh(greetingTextFutureProvider),
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
      ),
    );
  }
}
