part of 'counter_bloc.dart';

@immutable
sealed class CounterState extends Equatable {
  const CounterState();
  @override
  List<Object?> get props => [];
}

final class CounterInitial extends CounterState {}

final class CounterLoading extends CounterState {}

final class CounterLoaded extends CounterState {
  final CounterEntity counter;
  const CounterLoaded(this.counter);

  @override
  List<Object?> get props => [counter.value, counter.title, counter.completed];
}

final class CounterError extends CounterState {
  final String message;
  const CounterError(this.message);
  @override
  List<Object?> get props => [message];
}
