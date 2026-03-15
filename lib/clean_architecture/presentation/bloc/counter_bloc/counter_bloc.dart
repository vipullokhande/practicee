import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:practicee/clean_architecture/domain/entities/counter_entity.dart';
import 'package:practicee/clean_architecture/domain/usecases/getcounterusecase.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  final GetCounterUsecase useCase;
  CounterEntity? _current;
  CounterBloc(this.useCase) : super(CounterInitial()) {
    on<LoadCounter>((event, emit) async {
      emit(CounterLoading());
      try {
        _current = await useCase.getCounter();
        emit(CounterLoaded(_current!));
      } catch (e) {
        emit(CounterError(e.toString()));
      }
    });

    on<IncrementCounter>((event, emit) async {
      if (_current == null) return;
      emit(CounterLoading());
      try {
        _current = await useCase.increment(_current!.value);
        emit(CounterLoaded(_current!));
      } catch (e) {
        emit(CounterError(e.toString()));
      }
    });
  }
}
