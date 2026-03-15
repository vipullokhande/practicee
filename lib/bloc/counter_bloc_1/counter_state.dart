part of 'counter_bloc.dart';

@immutable
sealed class CounterState extends Equatable {
  @override
  List<Object?> get props => [];
}

final class CounterLoading extends CounterState {}

final class CounterInitial extends CounterState {
  final int counter;
  CounterInitial(this.counter);
}

class CounterEven extends CounterState {
  final int counter;
  CounterEven(this.counter);
  @override
  List<Object?> get props => [counter];
}

class CounterUpdated extends CounterState {
  final int previousEven;
  CounterUpdated(this.previousEven);
  @override
  List<Object?> get props => [previousEven];
}
