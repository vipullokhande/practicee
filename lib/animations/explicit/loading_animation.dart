import 'package:flutter/material.dart';

class LoadingAnimation extends StatefulWidget {
  final double progress;
  const LoadingAnimation({super.key, required this.progress});

  @override
  State<LoadingAnimation> createState() => _LoadingAnimationState();
}

class _LoadingAnimationState extends State<LoadingAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> progressAnimation;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );
    progressAnimation =
        Tween<double>(begin: 0, end: widget.progress).animate(_controller);
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: AnimatedBuilder(
          animation: progressAnimation,
          builder: (context, child) => Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(
                height: 200,
                width: 200,
                child: CircularProgressIndicator(
                  value: progressAnimation.value,
                  strokeWidth: 10,
                  backgroundColor: Colors.white,
                  color: Colors.blue,
                ),
              ),
              Text(
                ((progressAnimation.value * 100).toInt()).toString(),
                style: const TextStyle(fontSize: 30),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _controller
          ..reset()
          ..forward(),
      ),
    );
  }
}
