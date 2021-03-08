import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  int _counter = 0;

  CounterCubit() : super(CounterInitial(initialValue: 0));

  incrementCounter({int value}) async{
    emit(CounterLoading());

    await Future.delayed(Duration(seconds: 2));

    _counter += value;
    emit(CounterChanged(changedValue: _counter));
  }
}
