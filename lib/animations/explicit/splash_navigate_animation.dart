import 'dart:async';

import 'package:flutter/material.dart';

class SplashNavigateAnimation extends StatefulWidget {
  const SplashNavigateAnimation({super.key});

  @override
  State<SplashNavigateAnimation> createState() =>
      _SplashNavigateAnimationState();
}

class _SplashNavigateAnimationState extends State<SplashNavigateAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> scaleAnimation;
  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    controller.addListener(() {
      if (controller.isCompleted) {
        //First way to Navigate but we have to write this for all screens when navigating
        // Navigator.of(context).push(
        //   PageRouteBuilder(
        //     pageBuilder: (context, animation, child) => const Destination(),
        //     transitionsBuilder:
        //         (context, animation, secondaryAnimation, child) {
        //       final tween =
        //           Tween<Offset>(begin: const Offset(0, -1), end: Offset.zero)
        //               .animate(animation);
        //       return SlideTransition(
        //         position: tween,
        //         child: child,
        //       );
        //     },
        //   ),
        // );

        //Second way to Navigate create custom PageRouteBuilder
        Navigator.of(context).push(CustomTransitionRoute(
          route: const Destination(),
        ));
        Timer(const Duration(milliseconds: 100), () {
          controller.reset();
        });
      }
    });
    scaleAnimation = Tween<double>(begin: 1, end: 10).animate(controller);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
          onTap: () {
            controller.forward();
          },
          child: ScaleTransition(
            scale: scaleAnimation,
            child: Container(
              height: 100,
              width: 100,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.blue,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class Destination extends StatelessWidget {
  const Destination({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
        title: const Text("Destination"),
      ),
    );
  }
}

class CustomTransitionRoute extends PageRouteBuilder {
  final Widget route;
  CustomTransitionRoute({required this.route})
      : super(
          pageBuilder: (context, animation, secondaryAnimation) => route,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return SlideTransition(
              position:
                  Tween<Offset>(begin: const Offset(0, -1), end: Offset.zero)
                      .animate(animation),
              child: child,
            );
          },
        );
}
