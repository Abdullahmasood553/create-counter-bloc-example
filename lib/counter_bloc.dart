import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_test/counter_event.dart';

// enum CounterEvents { increment, decrement }

// class CounterBloc extends Bloc<CounterEvents, int> {
//   CounterBloc(int initialState) : super(initialState);

//   @override
//   // int get initialState => 0;
//   @override
//   Stream<int> mapEventToState(CounterEvents event) async* {
//     switch (event) {
//       case CounterEvents.increment:
//         yield state + 1;
//         break;
//       case CounterEvents.decrement:
//       yield state - 1;
//         break;
//     }
//   }
// }

class CounterBloc {
  final _eventController = StreamController<CounterEvent>();
  Stream<CounterEvent> get eventStream => _eventController.stream;
  Sink<CounterEvent> get eventSink => _eventController.sink;

  final _counterController = StreamController<int>();
  Stream<int> get counterStream => _counterController.stream;
  Sink<int> get counterSink => _counterController.sink;

  int _counter = 0;

  CounterBloc() {
    eventStream.listen((CounterEvent event) {
      if (event == CounterEvent.Increment) {
        ++_counter;
        counterSink.add(_counter);
      }
    });
  }

  void dispose() {
    _eventController.close();
    _counterController.close();
  }
}
