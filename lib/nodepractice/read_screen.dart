import 'package:flutter/material.dart';
import 'package:practicee/nodepractice/api.dart';
import 'package:practicee/nodepractice/title_model.dart';

class ReadScreen extends StatefulWidget {
  const ReadScreen({super.key});

  @override
  State<ReadScreen> createState() => _ReadScreenState();
}

class _ReadScreenState extends State<ReadScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: Api.getTitle(),
          builder: (context, snap) {
            List<TitleModel>? title = snap.data as List<TitleModel>?;
            return SizedBox(
              height: 400,
              child: ListView.builder(
                itemCount: title!.length,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    children: [
                      Text(
                        title[index].title,
                      ),
                      Text(
                        title[index].subTitle,
                      ),
                    ],
                  );
                },
              ),
            );
          }),
    );
  }
}
