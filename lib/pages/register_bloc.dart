import 'dart:async';

enum RegisterEvent {
  increment,
  decrement,
  register,
  delete,
}

class RegisterBloc {
  int _myCounter = 0;

  int get myCounter => _myCounter;

  final StreamController<int> _controller = StreamController.broadcast();
  Stream<int> get stream => _controller.stream;

  void addCounter(RegisterEvent event) {
    switch (event) {
      case RegisterEvent.increment:
        emit(_myCounter + 1);
        break;
      case RegisterEvent.decrement:
        emit(_myCounter - 1);
        break;
      case RegisterEvent.register:
        break;
      case RegisterEvent.delete:
        break;
    }
    // _controller.add(_myCounter);
  }

  emit(int value) {}

  void dispose() {
    _controller.close();
  }
}
