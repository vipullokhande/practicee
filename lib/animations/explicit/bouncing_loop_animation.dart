import 'package:flutter/material.dart';

class BouncingLoopAnimation extends StatefulWidget {
  const BouncingLoopAnimation({super.key});

  @override
  State<BouncingLoopAnimation> createState() => _BouncingLoopAnimationState();
}

class _BouncingLoopAnimationState extends State<BouncingLoopAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;
  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    animation = Tween<double>(begin: 0, end: 1).animate(controller);
    //First way to check animation status
    controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        controller.reverse();
      } else if (status == AnimationStatus.dismissed) {
        controller.forward();
      }
    });
    //Second way to check animation status
    // animation.addStatusListener((status) {
    //   if (status == AnimationStatus.completed) {
    //     controller.reverse();
    //   } else if (status == AnimationStatus.dismissed) {
    //     controller.forward();
    //   }
    // });
    controller.forward();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Center(
            child: Container(
              color: Colors.amber,
              height: 600,
              width: double.maxFinite,
              child: AnimatedBuilder(
                animation: animation,
                builder: (context, child) => CustomPaint(
                  painter: BouncingBallPainter(animation.value),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class BouncingBallPainter extends CustomPainter {
  double animationValue;
  BouncingBallPainter(this.animationValue);
  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawCircle(
        Offset(size.width / 2, size.height - (size.height * animationValue)),
        20,
        Paint()..color = Colors.blue);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
