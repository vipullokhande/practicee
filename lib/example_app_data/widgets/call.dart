import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Callss extends StatefulWidget {
  const Callss({Key? key}) : super(key: key);

  @override
  _CallssState createState() => _CallssState();
}

class _CallssState extends State<Callss> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Align(
        alignment: Alignment.bottomLeft,
        child: Container(
          margin: EdgeInsets.only(left: 20, bottom: 70),
          child: FloatingActionButton(
            onPressed: () {},
            child: Icon(
              FontAwesomeIcons.instagram,
              size: 40,
              color: Colors.pink,
            ),
          ),
        ),
      ),
      margin: EdgeInsets.only(top: 100.0),
      decoration: BoxDecoration(
        color: Colors.black12,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30.0),
          topRight: Radius.circular(30.0),
        ),
      ),
    );
  }
}
