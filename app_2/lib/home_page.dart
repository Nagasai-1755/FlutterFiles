import 'package:flutter/material.dart';
import 'package:intl/intl.dart';



class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _currentTime = "";
  String _currentDate = "";

  @override
  void initState() {
    super.initState();
    _updateTime();
  }

  _updateTime() async {
    DateTime now = DateTime.now();
    final dateFormatter = DateFormat('d MMMM yyyy');
    final timeFormatter = DateFormat('hh:mm:ss');

    setState(() {
      _currentTime = timeFormatter.format(now);
      _currentDate = dateFormatter.format(now);
    });

    // Update time every second
    await Future.delayed(Duration(seconds: 1));
    _updateTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text('Current Time and Date'),
        backgroundColor:const Color.fromARGB(255, 65, 210, 230),
        
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              _currentTime,
              style:const TextStyle(fontSize: 30),
            ),
            Text(
              _currentDate,
              style:const TextStyle(fontSize: 24),
            ),
          ],
        ),
      ),
    );
  }
}
