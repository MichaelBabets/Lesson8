part of 'counter_bloc.dart';

@immutable
abstract class CounterState {}

class CounterInitial extends CounterState {
  final int initialValue;

  CounterInitial({this.initialValue});
}

class CounterLoading extends CounterState {}

class CounterChanged extends CounterState {
  final int changedValue;

  CounterChanged({this.changedValue});
}

class CounterError extends CounterState {
  final String errorMsg;

  CounterError({this.errorMsg});
}

