import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class Panel extends StatelessWidget {
  final ScrollController controller;
  final PanelController panelController;
  Panel({
    Key? key,
    required this.controller,
    required this.panelController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      controller: controller,
      padding: const EdgeInsets.all(20.0),
      children: [
        GestureDetector(
          onTap: () {
            panelController.isPanelOpen
                ? panelController.close()
                : panelController.open();
          },
          child: Center(
            child: Container(
              width: 30,
              height: 7,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 30.0,
        ),
        Text("data"),
        SizedBox(
          height: 30.0,
        ),
        Text("data"),
        SizedBox(
          height: 30.0,
        ),
        Text("data"),
        SizedBox(
          height: 30.0,
        ),
        Text("data"),
        SizedBox(
          height: 30.0,
        ),
        Text("data"),
        SizedBox(
          height: 30.0,
        ),
        Text("data"),
        SizedBox(
          height: 30.0,
        ),
        Text("data"),
        SizedBox(
          height: 30.0,
        ),
        Text("data"),
        SizedBox(
          height: 30.0,
        ),
        Text("data"),
        SizedBox(
          height: 30.0,
        ),
        Text("data"),
        SizedBox(
          height: 30.0,
        ),
        Text("data"),
        SizedBox(
          height: 30.0,
        ),
        Text("data"),
        SizedBox(
          height: 30.0,
        ),
        Text("data"),
        SizedBox(
          height: 30.0,
        ),
        Text("data"),
        SizedBox(
          height: 30.0,
        ),
        Text("data"),
        SizedBox(
          height: 30.0,
        ),
        Text("data"),
        SizedBox(
          height: 30.0,
        ),
        Text("data"),
        SizedBox(
          height: 30.0,
        ),
        Text("data"),
        SizedBox(
          height: 30.0,
        ),
        Text("data"),
        SizedBox(
          height: 30.0,
        ),
        Text("data"),
      ],
    );
  }
}
