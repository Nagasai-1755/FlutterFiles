// ignore_for_file: dead_code

import 'package:flutter/material.dart';
import 'package:practice_app/exten_sion.dart';

void main() {
  runApp(
    const MaterialApp(
      home: Scaffold(
        body: ExtenSion(
          Color.fromARGB(255, 33, 5, 109),
          Color.fromARGB(255, 68, 21, 149),
        ),
      ),
    ),
  );
}
