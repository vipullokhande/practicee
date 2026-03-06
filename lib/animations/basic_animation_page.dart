import 'package:flutter/material.dart';

class BasicAnimationPage extends StatefulWidget {
  const BasicAnimationPage({super.key});

  @override
  State<BasicAnimationPage> createState() => _BasicAnimationPageState();
}

class _BasicAnimationPageState extends State<BasicAnimationPage>
    with SingleTickerProviderStateMixin {
  late AnimationController animController;
  late Animation<double> animation;
  @override
  void initState() {
    super.initState();
    animController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    );
    final curvedAnimation = CurvedAnimation(
      parent: animController,
      curve: Curves.bounceIn,
      reverseCurve: Curves.easeOut,
    );
    animation = Tween<double>(begin: 0.0, end: (2 * 3.14).toDouble())
        .animate(curvedAnimation)
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          animController.reverse();
        } else if (status == AnimationStatus.dismissed) {
          animController.forward();
        }
      });
    animController.forward();
  }

  @override
  void dispose() {
    animController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Transform.rotate(
        angle: animation.value,
        child: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(30),
          child: Image.asset(
            'assets/aventador.png',
          ),
        ),
      ),
    );
  }
}
