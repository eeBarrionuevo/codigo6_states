import 'package:flutter_bloc/flutter_bloc.dart';

class CounterCubit extends Cubit {
  CounterCubit(super.initialState);
  increment() {
    print("Increment");
  }

  decrement() {
    print("Decrement");
  }

  restart() {
    print("Restart");
  }
}
