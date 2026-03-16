import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';

class CourseCompleteAnimation extends StatefulWidget {
  const CourseCompleteAnimation({super.key});

  @override
  State<CourseCompleteAnimation> createState() =>
      _CourseCompleteAnimationState();
}

class _CourseCompleteAnimationState extends State<CourseCompleteAnimation> {
  bool isPlaying = false;
  late final ConfettiController _confettiController;
  @override
  void initState() {
    super.initState();
    _confettiController = ConfettiController();
    _confettiController.addListener(() {
      setState(() {
        isPlaying =
            _confettiController.state == ConfettiControllerState.playing;
      });
    });
    _confettiController.play();
  }

  @override
  void dispose() {
    _confettiController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: double.maxFinite,
        width: double.maxFinite,
        child: Stack(
          //If you want from top to bottom then Alignment.topCenter
          alignment: AlignmentGeometry.center,
          children: [
            Container(
              height: double.maxFinite,
              width: double.maxFinite,
              color: Colors.amber,
            ),
            TextButton(
              onPressed: () {
                if (isPlaying) {
                  _confettiController.stop();
                } else {
                  _confettiController.play();
                }
              },
              child: Text(isPlaying ? "Stop" : "Play"),
            ),
            ConfettiWidget(
              confettiController: _confettiController,
              blastDirectionality:
                  BlastDirectionality.explosive, //all directions
              // blastDirection:-PI/2 ,//up
              // blastDirection:PI ,//left
              // blastDirection:0 ,//right
              // blastDirection:PI/2 ,//down
              // colors: [], //colors.inside confetti
              // createParticlePath: (size) {
              //   final path = Path();
              //   path.addOval(Rect.fromCircle(
              //     center: Offset.zero,
              //     radius: 10,
              //   ));
              //   return path;
              // },//custom shape of each particle
              // gravity: 1,//speed of emission
            ),
          ],
        ),
      ),
    );
  }
}
