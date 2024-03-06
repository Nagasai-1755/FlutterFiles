import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title:const Text('Stack Widget Example'),
        ),
        body: Stack(
          children: <Widget>[
            Container(
              color: Colors.blue,
              width: double.infinity,
              height: double.infinity,
            ),
            Positioned(
              top: 50,
              left: 50,
              child: Container(
                color: Colors.red,
                width: 200,
                height: 200,
              ),
            ),
            Positioned(
              bottom: 50,
              right: 50,
              child: Container(
                color: Colors.green,
                width: 150,
                height: 150,
              ),
            ),
            Positioned(
              bottom:30,
              left: 20,
              child: Container(
                color: Colors.lightBlueAccent,
                width: 40,
                height: 38,
              ),
            )
          ],
        ),
      ),
    );
  }
}
