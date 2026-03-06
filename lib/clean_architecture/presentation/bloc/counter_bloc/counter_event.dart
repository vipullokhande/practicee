part of 'counter_bloc.dart';

@immutable
sealed class CounterEvent extends Equatable {
  const CounterEvent();
  @override
  List<Object?> get props => [];
}

final class LoadCounter extends CounterEvent {}

final class IncrementCounter extends CounterEvent {}
