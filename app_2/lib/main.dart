import 'package:app_2/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(TimeApp());
}

class TimeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:HomePage(),
    );
  }
}

