import 'package:practicee/clean_architecture/data/datasources/counter_remote_data_source.dart';
import 'package:practicee/clean_architecture/domain/entities/counter_entity.dart';
import 'package:practicee/clean_architecture/domain/repositories/counter_repository.dart';

class CounterRepositoryImpl implements CounterRepository {
  CounterRemoteDataSource _counterRemoteDataSource;
  CounterRepositoryImpl(this._counterRemoteDataSource);
  @override
  Future<CounterEntity> getCounter() async {
    return await _counterRemoteDataSource.getCounter();
  }

  @override
  Future<CounterEntity> increment(int current) async {
    return await _counterRemoteDataSource.increment(current);
  }
}
