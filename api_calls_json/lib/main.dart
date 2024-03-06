import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter HTTP Requests Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:const  MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _response = '';

  Future<void> fetchData() async {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
    if (response.statusCode == 200) {
      setState(() {
        _response = response.body;
      });
    }
  }

  Future<void> addData() async {
    final response = await http.post(
      Uri.parse('https://jsonplaceholder.typicode.com/posts'),
      body: json.encode({
        'title': 'New Post',
        'body': 'New Post Body',
        'userId': 1,
      }),
      headers: {'Content-Type': 'application/json'},
    );
    if (response.statusCode == 201) {
      setState(() {
        _response = response.body;
      });
    }
  }

  Future<void> updateData() async {
    final response = await http.put(
      Uri.parse('https://jsonplaceholder.typicode.com/posts/1'),
      body: json.encode({
        'id': 1,
        'title': 'Updated Post',
        'body': 'Updated Post Body',
        'userId': 1,
      }),
      headers: {'Content-Type': 'application/json'},
    );
    if (response.statusCode == 200) {
      setState(() {
        _response = response.body;
      });
    }
  }

  Future<void> deleteData() async {
    final response = await http
        .delete(Uri.parse('https://jsonplaceholder.typicode.com/posts/1'));
    if (response.statusCode == 200) {
      setState(() {
        _response = 'Deleted post with ID 1';
      });
    } 
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text('Flutter HTTP Requests Example'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton(
              onPressed: fetchData,
              child:const Text('Fetch Data (GET)'),
            ),
            ElevatedButton(
              onPressed: addData,
              child:const Text('Add Data (POST)'),
            ),
            ElevatedButton(
              onPressed: updateData,
              child:const Text('Update Data (PUT)'),
            ),
            ElevatedButton(
              onPressed: deleteData,
              child:const Text('Delete Data (DELETE)'),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: SingleChildScrollView(
                child: Text(
                  _response.isNotEmpty ? _response : 'No response yet',
                  style:const TextStyle(fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
