import 'dart:async';

class IntStream {
  int counter = 0;
  final StreamController<int> _controller = StreamController<int>.broadcast();
  Stream<int> get stream => _controller.stream;
  increment() {
    counter++;
    _controller.sink.add(counter);
  }

  decrement() {
    counter--;
    _controller.sink.add(counter);
  }
}
