import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueGrey[900],
          title: const Text('hello'),
        ),
        backgroundColor: Colors.blueGrey[100],
        body: const DiceApp(),
      ),
    );
  }
}

class DiceApp extends StatefulWidget {
  const DiceApp({Key? key}) : super(key: key);

  @override
  State<DiceApp> createState() => _DiceAppState();
}

class _DiceAppState extends State<DiceApp> {
  int rightDiceNumber = 1;
  int leftDiceNumber = 1;

  void randomise() {
    setState(() {
      rightDiceNumber = Random().nextInt(6) + 1;
      leftDiceNumber = Random().nextInt(6) + 1;
    });
    return;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: TextButton(
                      onPressed: () {
                        randomise();
                      },
                      child: Image.asset('images/dice-$leftDiceNumber.png')),
                ),
                const SizedBox(
                  width: 8.0,
                ),
                Expanded(
                  child: TextButton(
                      onPressed: () {
                        randomise();
                      },
                      child: Image.asset('images/dice-$rightDiceNumber.png')),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
