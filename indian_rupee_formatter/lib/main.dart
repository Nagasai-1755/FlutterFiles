import 'package:flutter/material.dart';
//import 'package:indian_rupee_formatter/method_2.dart';
import 'package:indian_rupee_formatter/rupee_formatter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'INDIAN RUPEE FORMATTER',
      debugShowCheckedModeBanner: false,
      home: RupeeFormatter(),
    );
  }
}