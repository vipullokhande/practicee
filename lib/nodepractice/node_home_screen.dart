import 'package:flutter/material.dart';
import 'package:practicee/nodepractice/create_screen.dart';
import 'package:practicee/nodepractice/delete_screen.dart';
import 'package:practicee/nodepractice/read_screen.dart';
import 'package:practicee/nodepractice/update_screen.dart';

class NodeHomeScreen extends StatefulWidget {
  const NodeHomeScreen({super.key});

  @override
  State<NodeHomeScreen> createState() => _NodeHomeScreenState();
}

class _NodeHomeScreenState extends State<NodeHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const CreateScreen(),
                ),
              );
            },
            child: const Text(
              'CREATE',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const ReadScreen(),
                ),
              );
            },
            child: const Text(
              'READ',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const UpdateScreen(),
                ),
              );
            },
            child: const Text(
              'UPDATE',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const DeleteScreen(),
                ),
              );
            },
            child: const Text(
              'DELETE',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
