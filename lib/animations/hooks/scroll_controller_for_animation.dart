import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

// ScrollController useScrollControllerForAnimation(
//     AnimationController animationController) {
//   ScrollController scrollController = ScrollController();
//   scrollController.addListener(() {
//     switch (scrollController.position.userScrollDirection) {
//       case ScrollDirection.forward:
//         animationController.forward();
//         break;
//       case ScrollDirection.reverse:
//         animationController.reverse();
//         break;
//       case ScrollDirection.idle:
//         break;
//       default:
//     }
//   });
//   // scrollController.dispose();
//   return scrollController;
// }

//For CustomHook
ScrollController useScrollControllerForAnimation(
    AnimationController animationController) {
  // ignore: deprecated_member_use
  return Hook.use(
    _ScrollCotrollerForAnimationHook(animationController: animationController),
  );
}

class _ScrollCotrollerForAnimationHook extends Hook<ScrollController> {
  final AnimationController animationController;
  const _ScrollCotrollerForAnimationHook({
    required this.animationController,
  });
  @override
  _ScrollCotrollerForAnimationHookState createState() =>
      _ScrollCotrollerForAnimationHookState();
}

class _ScrollCotrollerForAnimationHookState
    extends HookState<ScrollController, _ScrollCotrollerForAnimationHook> {
  late ScrollController _scrollController;
  @override
  void initHook() {
    _scrollController = ScrollController();
    _scrollController.addListener(() {
      switch (_scrollController.position.userScrollDirection) {
        case ScrollDirection.forward:
          hook.animationController.forward();
          break;
        case ScrollDirection.reverse:
          hook.animationController.reverse();
          break;
        case ScrollDirection.idle:
          break;
        default:
      }
    });
  }

  @override
  ScrollController build(BuildContext context) => _scrollController;
  @override
  void dispose() => _scrollController.dispose();
}
