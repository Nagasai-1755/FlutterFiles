import 'package:flutter/material.dart';

void main() {
  runApp(const ArrayApp());
}

class ArrayApp extends StatelessWidget {
  const ArrayApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // Sample data
  List<String> items = ['Apple', 'Banana', 'Orange', 'Grapes'];
  late TextEditingController _controller;
  late TextEditingController _controllerRem;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    _controllerRem = TextEditingController();
  }

  // Function to add a new item to the list
  void addItemToList() {
    setState(() {
      items.add(_controller.text);
      _controller.clear();
    });
  }

  void removeitem() {
    if (items.contains(_controllerRem.text)) {
      setState(() {
        items.remove(_controllerRem.text);
        _controllerRem.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Array Example'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(items[index]),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: const InputDecoration(
                      hintText: 'Enter new item',
                    ),
                  ),
                ),
                const SizedBox(width: 8.0),
                ElevatedButton(
                  onPressed: addItemToList,
                  child: const Text('Add Item'),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controllerRem,
                    decoration: const InputDecoration(
                      hintText: 'Enter item to delete',
                    ),
                  ),
                ),
                const SizedBox(width: 8.0),
                ElevatedButton(
                  onPressed:removeitem,
                  child: const Text('Remove Item'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    _controllerRem.dispose();
    super.dispose();
  }
}
