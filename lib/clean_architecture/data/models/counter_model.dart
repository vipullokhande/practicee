import 'package:practicee/clean_architecture/domain/entities/counter_entity.dart';

class CounterModel extends CounterEntity {
  CounterModel({
    required super.value,
    required super.title,
    required super.completed,
  });
  factory CounterModel.fromJson(Map<String, dynamic> json) {
    return CounterModel(
      value: json['id'] ?? 0,
      title: json['title'] ?? "No title",
      completed: json['completed'] ?? false,
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'value': value,
      'title': title,
      'completed': completed,
    };
  }
}
