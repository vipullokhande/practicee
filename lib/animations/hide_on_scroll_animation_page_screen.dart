import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class HideOnScrollPageScreen extends StatefulWidget {
  const HideOnScrollPageScreen({super.key});

  @override
  State<HideOnScrollPageScreen> createState() => _HideOnScrollPageScreenState();
}

class _HideOnScrollPageScreenState extends State<HideOnScrollPageScreen>
    with SingleTickerProviderStateMixin {
  late ScrollController scrollController;
  late AnimationController animationController;
  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();
    animationController = AnimationController(
      vsync: this,
      duration: kThemeAnimationDuration,
      value: 1,
    );
    scrollController.addListener(() {
      switch (scrollController.position.userScrollDirection) {
        case ScrollDirection.forward:
          animationController.forward();
          break;
        case ScrollDirection.reverse:
          animationController.reverse();
          break;
        case ScrollDirection.idle:
          break;
        default:
      }
    });
    animationController.forward();
  }

  @override
  void dispose() {
    scrollController.dispose();
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
        opacity: animationController,
        child: ScaleTransition(
          scale: animationController,
          child: FloatingActionButton.extended(
            label: const Text('Hello'),
            onPressed: () {},
          ),
        ),
      ),
    );
  }
}
