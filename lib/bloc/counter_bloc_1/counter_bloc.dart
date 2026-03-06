import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'counter_event.dart';
part 'counter_state.dart';

//Bloc Event Transformers
//Add bloc_concurrency to pubspec.yaml
//Types - 1)sequential, 2)droppable, 3)restartable, 4)concurrent
//1)sequential - waits until previous event completes then proceed to next event
//2)droppable - new events are dropped only first event executes
//3)restartable - if current events are running then it stop executing them and run new event
//4)concurrent - all events are executed at once or parallel
class CounterBloc extends Bloc<CounterEvent, CounterState> {
  int counter = 0;
  int previous = 0;
  CounterBloc() : super(CounterInitial(0)) {
    on<IncrementEvent>((event, emit) async {
      emit(CounterLoading());
      await Future.delayed(const Duration(seconds: 3));
      counter++;
      if (counter.isEven) {
        previous = counter;
        emit(CounterEven(counter));
      } else {
        previous = counter;
        emit(CounterUpdated(previous));
      }
    });
    on<DecrementEvent>((event, emit) async {
      emit(CounterLoading());
      await Future.delayed(const Duration(seconds: 3));
      counter--;
      if (counter.isEven) {
        previous = counter;
        emit(CounterEven(counter));
      } else {
        previous = counter;
        emit(CounterUpdated(previous));
      }
    });
  }
}
