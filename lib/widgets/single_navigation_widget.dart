import 'package:flutter/material.dart';
import 'package:practicee/main.dart';

// ignore: must_be_immutable
class SingleNavigationWidget extends StatelessWidget {
  NavigationItem navigationItem;
  IconData icon;
  String title;
  Color color;
  VoidCallback onTap;
  Color textColor;
  Color iconColor;
  SingleNavigationWidget({
    Key? key,
    required this.navigationItem,
    required this.icon,
    required this.title,
    required this.color,
    required this.textColor,
    required this.iconColor,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        right: 10,
      ).copyWith(
        bottom: 7,
        top: 7,
      ),
      child: GestureDetector(
        onTap: onTap,
        child: Material(
          color: color,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
            side: BorderSide(
              width: 1,
              color: Colors.grey,
            ),
          ),
          child: SizedBox(
            height: 50,
            child: Row(
              children: [
                SizedBox(
                  width: 50,
                  child: Icon(
                    icon,
                    color: iconColor,
                  ),
                ),
                Text(
                  title,
                  style: TextStyle(
                    color: textColor,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
