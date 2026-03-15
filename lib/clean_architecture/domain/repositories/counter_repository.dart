import 'package:practicee/clean_architecture/domain/entities/counter_entity.dart';

abstract class CounterRepository {
  Future<CounterEntity> getCounter();
  Future<CounterEntity> increment(int current);
}
