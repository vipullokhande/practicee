import 'package:flutter/material.dart';

class AnimationWidgetsScreen extends StatefulWidget {
  const AnimationWidgetsScreen({super.key});

  @override
  State<AnimationWidgetsScreen> createState() => _AnimationWidgetsScreenState();
}

class _AnimationWidgetsScreenState extends State<AnimationWidgetsScreen>
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
      ..addListener(() {})
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
      body: RotatingTransition(
        angle: animation,
        child: const VipImage(),
      ),
    );
  }
}

class RotatingTransition extends StatelessWidget {
  final Widget child;
  final Animation<double> angle;
  const RotatingTransition({
    super.key,
    required this.child,
    required this.angle,
  });
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: angle,
        child: child,
        builder: (context, child) {
          return Transform.rotate(
            angle: angle.value,
            child: child,
          );
        });
  }
}

class VipImage extends StatelessWidget {
  const VipImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.all(30),
      child: Image.asset(
        'assets/aventador.png',
      ),
    );
  }
}
// class VipImage extends AnimatedWidget {
//   const VipImage({super.key, required super.listenable});

//   @override
//   Widget build(BuildContext context) {
//     final animation = super.listenable as Animation<double>;
//     return Transform.rotate(
//       angle: animation.value,
//       child: Container(
//         alignment: Alignment.center,
//         padding: const EdgeInsets.all(30),
//         child: Image.asset(
//           'assets/aventador.png',
//         ),
//       ),
//     );
//   }
// }
