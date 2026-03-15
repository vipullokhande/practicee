import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:practicee/animations/hooks/scroll_controller_for_animation.dart';

class HomePage extends HookWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final hideFABAnimController = useAnimationController(
      duration: kThemeAnimationDuration,
      initialValue: 1,
    );
    final ScrollController scrollController =
        useScrollControllerForAnimation(hideFABAnimController);
    return Scaffold(
      body: ListView.builder(
        controller: scrollController,
        itemCount: 5,
        itemBuilder: (context, index) {
          return Image.asset(
            'assets/aventador.png',
            height: 200,
          );
        },
      ),
      floatingActionButton: FadeTransition(
        opacity: hideFABAnimController,
        child: ScaleTransition(
          scale: hideFABAnimController,
          child: FloatingActionButton.extended(
            label: const Text('Hello'),
            onPressed: () {},
          ),
        ),
      ),
    );
  }
}
