import 'package:flutter/material.dart';

class Story extends StatelessWidget {
  const Story({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        InkWell(
          splashColor: Colors.grey.shade300,
          onTap: () {},
          child: Container(
            margin: const EdgeInsets.only(
              top: 10.0,
              left: 8.0,
            ),
            width: 66.0,
            height: 66.0,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.orange.shade700,
                  Colors.red.shade400,
                  Colors.pink.shade300,
                ],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
              shape: BoxShape.circle,
            ),
            child: const Padding(
              padding: EdgeInsets.all(5.0),
              child: CircleAvatar(
                // backgroundImage: AssetImage('assets/splash.png'),
                backgroundImage: NetworkImage(
                    "https://play-lh.googleusercontent.com/6UgEjh8Xuts4nwdWzTnWH8QtLuHqRMUB7dp24JYVE2xcYzq4HA8hFfcAbU-R-PC_9uA1"),
                radius: 60.0,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
