import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class AnimatedText extends StatelessWidget {
  const AnimatedText({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 100),
            // Container(
            //   height: 100,
            //   child: AnimatedTextKit(
            //     repeatForever: true,
            //     animatedTexts: const [
            //       //Type of Animation Widget from pub.dev
            //     ],
            //     onTap: () {
            //       print("Tap Event");
            //     },
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
