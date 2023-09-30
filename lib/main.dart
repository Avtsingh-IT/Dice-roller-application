import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blue,
        appBar: AppBar(
          title: const Center(
            child: Text(
              'Dice Roller',
              style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
            ),
          ),
          backgroundColor: Colors.black,
        ),
        body: const DicePage(),
      ),
    ),
  );
}

class DicePage extends StatefulWidget {
  const DicePage({Key? key}) : super(key: key);

  @override
  State<DicePage> createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  //DicePage({super.key});
  int leftDiceRoll = 1;
  int rightDiceRoll = Random().nextInt(6) + 1;
  void changediceface() {
    setState(() {
      leftDiceRoll = Random().nextInt(6) + 1;
      rightDiceRoll = Random().nextInt(6) + 1;
      print("Pressed");
      print(leftDiceRoll);
      print(rightDiceRoll );
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text(
            "Press on the Dice to roll it",
            style: TextStyle(color: Colors.black, fontSize: 20),
          ),
          const SizedBox(
            height: 19,
          ),
          Row(
            children: [
              Expanded(
                child: TextButton(
                  onPressed: () {
                    setState(() {
                      changediceface();
                      print(leftDiceRoll);
                    });
                  },
                  child: Image.asset('images/dice-$leftDiceRoll.png'),
                ),
              ),
              Expanded(
                child: TextButton(
                  onPressed: () {
                    setState(() {
                      changediceface();
                    });
                  },
                  child: Image.asset('images/dice-$rightDiceRoll.png'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
