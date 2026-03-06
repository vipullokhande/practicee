import 'package:get_it/get_it.dart';
import 'package:practicee/clean_architecture/data/datasources/counter_remote_data_source.dart';
import 'package:practicee/clean_architecture/data/repositories/counter_repository_impl.dart';
import 'package:practicee/clean_architecture/domain/repositories/counter_repository.dart';
import 'package:practicee/clean_architecture/domain/usecases/getcounterusecase.dart';
import 'package:practicee/clean_architecture/presentation/bloc/counter_bloc/counter_bloc.dart';

final s1 = GetIt.instance;
Future<void> init() async {
  //usecase
  s1.registerLazySingleton<GetCounterUsecase>(() => GetCounterUsecase(s1()));

  //repository
  s1.registerLazySingleton<CounterRepository>(
      () => CounterRepositoryImpl(s1()));

  //datasources
  s1.registerLazySingleton<CounterRemoteDataSource>(
      () => CounterRemoteDataSourceImpl());

  //bloc
  s1.registerFactory(() => CounterBloc(s1()));
}
