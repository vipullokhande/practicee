import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final textProvider = StateProvider((_) => "");

class RiverpodConsumerStatefulExample extends ConsumerStatefulWidget {
  const RiverpodConsumerStatefulExample({super.key});

  @override
  ConsumerState<RiverpodConsumerStatefulExample> createState() =>
      _RiverpodConsumerStatefulExampleState();
}

class _RiverpodConsumerStatefulExampleState
    extends ConsumerState<RiverpodConsumerStatefulExample> {
  late final TextEditingController _textEditingController;
  @override
  void initState() {
    super.initState();
    _textEditingController = TextEditingController();
    _textEditingController.addListener(() {
      ref.read(textProvider.notifier).state = _textEditingController.text;
    });
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final updatedText = ref.watch(textProvider);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: _textEditingController,
            ),
            Center(
              child: Text("You types $updatedText"),
            )
          ],
        ),
      ),
    );
  }
}
