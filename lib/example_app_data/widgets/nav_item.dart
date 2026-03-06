import 'package:flutter/material.dart';

class NavItem extends StatelessWidget {
  const NavItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
      child: TextButton.icon(
        onPressed: null,
        icon: Icon(
          Icons.home,
          color: Colors.black,
          size: 30.0,
        ),
        label: Text(
          'Home',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 16.0,
          ),
        ),
      ),
    );
  }
}
