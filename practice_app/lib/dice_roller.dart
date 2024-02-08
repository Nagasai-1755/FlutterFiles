import 'package:flutter/material.dart';
import 'dart:math';

//import 'package:practice_app/dice_roller.dart';
final randomizer = Random();

class DiceRoller extends StatefulWidget {
  const DiceRoller({super.key});
  @override
  State<DiceRoller> createState() {
    return _DiceRollerState();
  }
}

class _DiceRollerState extends State<DiceRoller> {
  var currentDiceRoll = 2;
  //var activeDiceImage = 'windows/Images/dice-2.png';

  void rollDice() {
    setState(() {
      currentDiceRoll = Random().nextInt(6) + 1;
      ;
    });
  }

  @override
  Widget build(context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          'windows/Images/dice-$currentDiceRoll.png',
          //activeDiceImage,
          //'Images/dice-6.png',
          width: 200,
        ),
        TextButton(
          onPressed: rollDice,
          style: TextButton.styleFrom(
            padding: const EdgeInsets.only(
              top: 20,
            ),
            foregroundColor: Colors.white,
            textStyle: const TextStyle(fontSize: 28),
          ),
          child: const Text('Roll Dice'),
        )
      ],
    );
  }
}
