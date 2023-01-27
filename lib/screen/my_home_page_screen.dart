import 'package:flutter/material.dart';
import 'package:hooks_examples/widgets/blue_square_with_hook.dart';

class MyHomePageScreen extends StatefulWidget {
  const MyHomePageScreen({super.key, required this.title});

  final String title;

  @override
  State<MyHomePageScreen> createState() => _MyHomePageScreenState();
}

class _MyHomePageScreenState extends State<MyHomePageScreen> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
                () {
              //var blueSquare = const BlueSquareWithStateful(size: 300);
              //var blueSquare = const BlueSquareWithStatefulNoClickRepeat();
              var blueSquare = const BlueSquareWithHook(size: 100);
              return blueSquare;
              //return const LogoApp();
            }(),
/*
            Text(
              'Your Random Number is ${randomNumber.toString()}',
            ),
*/
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _incrementCounter();

        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
