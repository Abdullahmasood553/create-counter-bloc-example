import 'package:bloc_test/counter_bloc.dart';
import 'package:bloc_test/counter_event.dart';
import 'package:flutter/material.dart';

// import 'package:bloc_test/counter_bloc.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// void main() => runApp(MyApp());

// class MyApp extends StatefulWidget {
//   MyApp({Key? key}) : super(key: key);

//   @override
//   _MyAppState createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(primarySwatch: Colors.blue),
//       home: Scaffold(
//         body: BlocProvider(
//           create: (BuildContext context) => CounterBloc(0),
//           child: CounterScreen(),
//         ),
//       ),
//     );
//   }
// }

// class CounterScreen extends StatefulWidget {
//   const CounterScreen({Key? key}) : super(key: key);

//   @override
//   _CounterScreenState createState() => _CounterScreenState();
// }

// class _CounterScreenState extends State<CounterScreen> {
//   @override
//   Widget build(BuildContext context) {

//     final _counterBloc = BlocProvider.of<CounterBloc>(context);
//     return Center(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           BlocBuilder<CounterBloc, int>(
//             builder: (BuildContext context, int state) {
//               return Text(
//                 'Counter Value: $state',
//                 style: TextStyle(fontSize: 30),
//               );
//             },
//           ),
//           ButtonBar(
//             alignment: MainAxisAlignment.center,
//             children: [
//               ElevatedButton(
//                 onPressed: () {
//                   _counterBloc.add(CounterEvents.increment);
//                 },
//                 child: Text('increment'),
//               ),
//               ElevatedButton(
//                 onPressed: () {
//                   _counterBloc.add(CounterEvents.decrement);
//                 },
//                 child: Text('decrement'),
//               )
//             ],
//           )
//         ],
//       ),
//     );
//   }
// }

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final CounterBloc _counterBloc = CounterBloc();

 
  void dispose() {
    // Don't forget to close all the stream
    _counterBloc.dispose();
    //super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
          body: Center(
            child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          'You have pushed the button this many times:',
        ),
        // wrap counter text with StreamBuilder
        // it rebuilds itself when new data comes in stream
        StreamBuilder<int>(
          //listen to the counterStream
          stream: _counterBloc.counterStream,
          initialData: 0,
          builder: (context, snapshot) {
            // get the data
            final counter = snapshot.data;
            return Text(
              '$counter',
              style: Theme.of(context).textTheme.headline4,
            );
          },
        ),
      ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: _incrementCounter,
            tooltip: 'Increment',
            child: Icon(Icons.add),
          ),
        ),
    );
  }

  void _incrementCounter() {
    // add event to notify bloc
    _counterBloc.eventSink.add(CounterEvent.Increment);
  }
}
