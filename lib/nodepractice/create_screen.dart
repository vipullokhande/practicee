import 'package:flutter/material.dart';
import 'package:practicee/nodepractice/api.dart';

class CreateScreen extends StatefulWidget {
  const CreateScreen({super.key});

  @override
  State<CreateScreen> createState() => _CreateScreenState();
}

class _CreateScreenState extends State<CreateScreen> {
  final titleController = TextEditingController();
  final subTitleController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TextField(
            controller: titleController,
            decoration: const InputDecoration(
              hintText: 'Enter Title',
            ),
          ),
          TextField(
            controller: subTitleController,
            decoration: const InputDecoration(
              hintText: 'Enter Sub-title',
            ),
          ),
          ElevatedButton(
            onPressed: () {
              var data = {
                "title": titleController.text,
                "subtitle": subTitleController.text
              };
              Api.addTitle(data);
            },
            child: const Text(
              'CREATE',
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
