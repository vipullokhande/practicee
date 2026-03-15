import 'dart:math';

import 'package:flutter/material.dart';

class ImplicitAnimationFirst extends StatefulWidget {
  const ImplicitAnimationFirst({super.key});

  @override
  State<ImplicitAnimationFirst> createState() => _ImplicitAnimationFirstState();
}

class _ImplicitAnimationFirstState extends State<ImplicitAnimationFirst> {
  late List<Color> currentPallete = genrateRandomColor();
  List<Color> genrateRandomColor() {
    final random = Random();
    return List.generate(
      5,
      (_) => Color.fromRGBO(
        random.nextInt(256),
        random.nextInt(256),
        random.nextInt(256),
        1,
      ),
    );
  }

  changePallete() {
    setState(() {
      currentPallete = genrateRandomColor();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: currentPallete
                    .map(
                      (color) => AnimatedContainer(
                        height: 100,
                        width: 100,
                        margin: const EdgeInsets.only(bottom: 20),
                        color: color,
                        duration: const Duration(milliseconds: 500),
                      ),
                    )
                    .toList(),
              ),
            ),
            TextButton(
              onPressed: () {
                changePallete();
              },
              child: const Text("Change"),
            )
          ],
        ));
  }
}
