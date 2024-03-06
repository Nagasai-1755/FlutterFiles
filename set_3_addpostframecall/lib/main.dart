import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();

    // Schedule a callback to be executed after the frame has been rendered
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // Perform operations after the frame has been rendered
      print('Frame has been rendered!');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text('Post Frame Callback Demo'),
      ),
      body:const Center(
        child: Text('Hello World'),
      ),
    );
  }
}
