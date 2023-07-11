import 'package:flutter_bloc/flutter_bloc.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterLoaded(number: 1));

  int number = 1;

  void increment() {
    if (number >= 10) {
    } else {
      number++;
      emit(CounterLoaded(number: number));
    }
  }

  void decrement() {
    if (number <= 1) {
    } else {
      number--;
      emit(CounterLoaded(number: number));
    }
  }
}
