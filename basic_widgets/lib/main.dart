// import 'package:basic_widgets/login_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text('Basic Widgets Example'),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    color: Colors.red,
                  ),
                  Container(
                    width: 100,
                    height: 100,
                    color: Colors.green,
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Image.network(
                    'https://imgs.search.brave.com/B1ob_m_a3MvtHW5GXCx5kKaQJMCKlrVqFoRDGTy4jr0/rs:fit:500:0:0/g:ce/aHR0cHM6Ly9zdGF0/aWMuZGhpd2lzZS5j/b20vaG9tZS9kZXYt/YmxhY2tfMjAoMSku/d2VicD93PTM4NDAm/cT03NQ', // Replace with the cat image URL
                    fit: BoxFit.cover,
                  ),
                 const Text(
                    'Cat Image', // Text overlay
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
