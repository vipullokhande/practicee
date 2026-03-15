import 'package:practicee/clean_architecture/domain/entities/counter_entity.dart';
import 'package:practicee/clean_architecture/domain/repositories/counter_repository.dart';

class GetCounterUsecase {
  final CounterRepository _counterRepository;
  GetCounterUsecase(this._counterRepository);
  Future<CounterEntity> getCounter() async {
    return await _counterRepository.getCounter();
  }

  Future<CounterEntity> increment(int current) async {
    return await _counterRepository.increment(current);
  }
}
