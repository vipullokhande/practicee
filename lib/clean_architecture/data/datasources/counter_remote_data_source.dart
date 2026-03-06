import 'dart:convert';
import 'package:practicee/clean_architecture/data/models/counter_model.dart';
import 'package:http/http.dart' as http;

abstract class CounterRemoteDataSource {
  Future<CounterModel> getCounter();
  Future<CounterModel> increment(int current);
}

class CounterRemoteDataSourceImpl implements CounterRemoteDataSource {
  @override
  Future<CounterModel> getCounter() async {
    final response = await http.get(
      Uri.parse("https://jsonplaceholder.typicode.com/todos/1"),
    );
    if (response.statusCode == 200) {
      return CounterModel.fromJson(json.decode(response.body));
    } else {
      throw Exception("Failed to fetch counter");
    }
  }

  @override
  Future<CounterModel> increment(int current) async {
    await Future.delayed(const Duration(seconds: 1));
    return CounterModel(
      value: current + 1,
      title: "Incremented locally",
      completed: false,
    );
  }
}
