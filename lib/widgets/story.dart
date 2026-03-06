import 'package:flutter/material.dart';

class Story extends StatefulWidget {
  const Story({Key? key}) : super(key: key);

  @override
  State<Story> createState() => _StoryState();
}

class _StoryState extends State<Story> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.grey.shade300,
      onTap: () {},
      child: Container(
        margin: const EdgeInsets.only(
            top: 10.0, left: 5.0, right: 5.0, bottom: 10.0),
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
          padding: EdgeInsets.all(4.0),
          child: CircleAvatar(
            backgroundImage: AssetImage('assets/current.png'),
            // backgroundImage: NetworkImage(
            //     "https://play-lh.googleusercontent.com/6UgEjh8Xuts4nwdWzTnWH8QtLuHqRMUB7dp24JYVE2xcYzq4HA8hFfcAbU-R-PC_9uA1"),
            radius: 30.0,
          ),
        ),
      ),
    );
  }
}
