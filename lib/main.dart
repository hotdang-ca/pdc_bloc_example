import 'package:flutter/material.dart';
import 'package:pdc_bloc_example/counter_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => CounterProvider(),
      child: const MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyStatelessHomepage(title: 'A better counter'),
    );
  }
}

class MyStatelessHomepage extends StatelessWidget {
  final String title;

  const MyStatelessHomepage({ Key? key, required this.title }) : super(key: key);

  void _incrementCounter(BuildContext context) {
    Provider.of<CounterProvider>(context, listen: false).increment();
  }

  void _decrementCounter(BuildContext context) {
    Provider.of<CounterProvider>(context, listen: false).decrement();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CounterProvider>(
      builder:(context, value, child) {
        return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'You have pushed the button this many times:',
              ),
              Text(
                value.count.toString(),
                style: Theme.of(context).textTheme.headline4,
              ),
            ],
          ),
        ),
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: FloatingActionButton(
                onPressed: () =>_incrementCounter(context),
                tooltip: 'Increment',
                child: const Icon(Icons.add),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: FloatingActionButton(
                onPressed: () => _decrementCounter(context),
                tooltip: 'Decrement',
                child: const Icon(Icons.remove),
              ),
            ),
          ],) // This trailing comma makes auto-formatting nicer for build methods.
      );
      }
    );
  }
}
