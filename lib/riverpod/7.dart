import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:practicee/riverpod/2.dart';

final greetingProvider = AsyncNotifierProvider<AsyncStringProvider, String>(
  () => AsyncStringProvider(),
);

class AsyncStringProvider extends AsyncNotifier<String> {
  @override
  FutureOr<String> build() async {
    return await ref.read(fakeServiceProvider).getGreeting();
  }

  Future<void> refreshGreeting() async {
    try {
      state = const AsyncLoading();
      final value = await ref.read(fakeServiceProvider).getGreeting();
      state = AsyncData(value);
    } catch (e) {
      state = AsyncError(e, StackTrace.current);
    }
  }
}

class RiverpodAsyncStringProvider extends ConsumerWidget {
  const RiverpodAsyncStringProvider({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final greetingAsync = ref.watch(greetingProvider);
    final greetingControl = ref.watch(greetingProvider.notifier);
    return Scaffold(
      body: Center(
        child: greetingAsync.when(
          data: (data) => Text(data),
          error: (error, stackTrace) {
            return Text("Error ${error.toString()}");
          },
          loading: () => const Center(
            child: CircularProgressIndicator(),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => greetingControl.refreshGreeting(),
      ),
    );
  }
}
