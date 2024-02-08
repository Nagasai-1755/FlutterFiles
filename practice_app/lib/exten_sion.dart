import 'package:flutter/material.dart';
import 'package:practice_app/dice_roller.dart';

const alignment_1 = Alignment.topLeft;
const alingnment_2 = Alignment.bottomRight;

class ExtenSion extends StatelessWidget {
  const ExtenSion(this.color1, this.color2, {super.key});
  final Color color1;
  final Color color2;

  @override
  Widget build(context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [color1, color2],
          begin: alignment_1,
          end: alingnment_2,
          //begin: Alignment.topLeft,
          //end: Alignment.bottomRight,
        ),
      ),
      child: Center(
        child: DiceRoller(),
      ),
    );
  }
}
