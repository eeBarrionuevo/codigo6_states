import 'package:flutter_bloc/flutter_bloc.dart';

//Estados
abstract class CounterState {}

class CounterInitState extends CounterState {
  final int data = 0;
}

class IncrementState extends CounterState {
  final int data;
  IncrementState(this.data);
}

class DecrementState extends CounterState {
  final int data;
  DecrementState(this.data);
}

//Cubit

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterInitState());

  increment() {
    print(state);
    if (state is CounterInitState) {
      CounterInitState current = state as CounterInitState;
      print(current.data);
      emit(IncrementState(current.data + 1));
    } else if (state is IncrementState) {
      // emit(IncrementState(state.));
      IncrementState curret = state as IncrementState;
      emit(IncrementState(curret.data + 1));
    }
  }

  decrement() {
    print("Decrement");
  }

  restart() {
    print("Restart");
  }
}
