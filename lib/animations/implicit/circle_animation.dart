import 'package:flutter/material.dart';

class CircleAnimation extends StatelessWidget {
  const CircleAnimation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: TweenAnimationBuilder(
          tween: Tween<double>(begin: 0, end: 200),
          duration: const Duration(milliseconds: 1500),
          builder: (context, value, child) => Container(
            width: value,
            height: value,
            decoration: BoxDecoration(
              color: Colors.blue,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.blue.withOpacity(0.5),
                  blurRadius: value,
                  spreadRadius: value / 2,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
