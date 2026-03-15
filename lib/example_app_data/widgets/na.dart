import 'package:flutter/material.dart';

class Na extends StatelessWidget {
  const Na({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
          top: 20.0, left: 15.0, bottom: 10.0, right: 5.0),
      child: CircleAvatar(
        backgroundImage: AssetImage("lib/assets/images/snapchat.png"),
        radius: 40,
      ),
    );
  }
}
