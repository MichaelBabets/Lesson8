part of 'counter_bloc.dart';

@immutable
abstract class CounterEvent {}

class IncrementEvent extends CounterEvent{
  final int value;

  IncrementEvent({this.value});
}

class DecrementEvent extends CounterEvent {}
