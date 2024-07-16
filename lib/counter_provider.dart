import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterCubit extends Cubit<int> {
  CounterCubit() : super(0);
  void increment() => emit(state + 1);
  void decrement() => emit(state - 1);
}

abstract class CounterEvent {}

class CounterIncrementPressedEvent extends CounterEvent {
  @override
  String toString() {
    return 'Count goes up!';
  }
}

class CounterDecrementPressedEvent extends CounterEvent {
  @override
  String toString() {
    return 'Count goes down!';
  }
}

class CounterBLoC extends Bloc<CounterEvent, int> {
  CounterBLoC() : super(0) {
    on<CounterIncrementPressedEvent>((event, emit) => emit(state + 1));
    on<CounterDecrementPressedEvent>((event, emit) => emit(state - 1));
  }

  @override
  void onTransition(Transition<CounterEvent, int> transition) {
    print(transition);

    super.onTransition(transition);
  }
}

class CounterProvider with ChangeNotifier {
  int _count = 0;
  int get count => _count;

  void increment() {
    _count++;
    notifyListeners();
  }

  void decrement() {
    _count--;
    notifyListeners();
  }
}
