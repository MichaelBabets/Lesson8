import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  int _counter = 0;

  CounterBloc() : super(CounterInitial(initialValue: 0));

  @override
  Stream<CounterState> mapEventToState(CounterEvent event) async* {

    if(event is IncrementEvent) {

      yield CounterLoading();

      await Future.delayed(Duration(seconds: 2));

      _counter += event.value;
      yield CounterChanged(changedValue: _counter);

    }
  }
}
