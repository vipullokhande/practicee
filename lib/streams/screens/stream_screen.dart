import 'dart:async';
import 'package:flutter/material.dart';
import 'package:practicee/streams/services/int_stream.dart';

class StreamScreen extends StatefulWidget {
  const StreamScreen({super.key});

  @override
  State<StreamScreen> createState() => _StreamScreenState();
}

class _StreamScreenState extends State<StreamScreen> {
  TextEditingController controller = TextEditingController();
  late IntStream _intStream;
  @override
  void initState() {
    super.initState();
    _intStream = IntStream();
  }

  @override
  Widget build(BuildContext context) {
    print("Rebuild called");
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 200,
            ),
            SizedBox(
              height: 100,
              child: StreamBuilder<int>(
                stream: _intStream.stream,
                initialData: 0,
                builder: (context, snap) {
                  print("Stream rebuild called");
                  if (snap.hasData) {
                    return Text(snap.data.toString());
                  } else {
                    return const Text('No data');
                  }
                },
              ),
            ),
            SizedBox(
              height: 100,
              child: TextField(
                controller: controller,
                decoration: const InputDecoration(),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                _intStream.increment();
              },
              child: const Text(
                'increment',
              ),
            ),
            ElevatedButton(
              onPressed: () {
                _intStream.decrement();
              },
              child: const Text(
                'Decrement',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
