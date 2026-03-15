import 'package:flutter/material.dart';

class FadeSlideScaleAnimation extends StatefulWidget {
  const FadeSlideScaleAnimation({super.key});

  @override
  State<FadeSlideScaleAnimation> createState() =>
      _FadeSlideScaleAnimationState();
}

class _FadeSlideScaleAnimationState extends State<FadeSlideScaleAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> opacityAnimation;
  late Animation<Offset> slideAnimation;
  late Animation<double> scaleAnimation;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );
    opacityAnimation = Tween<double>(begin: 0, end: 1).animate(_controller);
    slideAnimation =
        Tween<Offset>(begin: const Offset(-1, -1), end: const Offset(0, 0))
            .animate(_controller);
    scaleAnimation = Tween<double>(begin: 0, end: 1).animate(_controller);
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: FloatingActionButton(onPressed: () {
        if (_controller.isCompleted) {
          _controller.reverse();
        } else {
          _controller.forward();
        }
      }),
      body: Column(
        children: [
          FadeTransition(
            opacity: opacityAnimation,
            child: const FlutterLogo(
              size: 200,
            ),
          ),
          SlideTransition(
            position: slideAnimation,
            child: ScaleTransition(
              scale: scaleAnimation,
              child: Column(
                children: [
                  const TextField(
                    decoration: InputDecoration(
                      hintText: "Enter Email",
                      border: OutlineInputBorder(),
                    ),
                  ),
                  TextButton(onPressed: () {}, child: const Text("Login")),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
