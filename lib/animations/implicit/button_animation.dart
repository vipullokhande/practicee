import 'package:flutter/material.dart';

class ButtonAnimation extends StatefulWidget {
  const ButtonAnimation({super.key});

  @override
  State<ButtonAnimation> createState() => _ButtonAnimationState();
}

class _ButtonAnimationState extends State<ButtonAnimation> {
  bool isExpanded = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Center(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  isExpanded = !isExpanded;
                });
              },
              child: AnimatedContainer(
                duration: const Duration(seconds: 1),
                width: isExpanded ? 200 : 50,
                height: 60,
                decoration: BoxDecoration(
                  color: isExpanded ? Colors.green : Colors.red,
                  borderRadius: BorderRadius.circular(isExpanded ? 30 : 10),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      isExpanded ? Icons.check : Icons.shopping_bag,
                    ),
                    if (isExpanded) ...[
                      const SizedBox(width: 8),
                      const Text("Added to cart"),
                    ]
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
