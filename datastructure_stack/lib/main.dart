import 'package:flutter/material.dart';

void main() {
  runApp(const StackApp());
}

class StackData {
  final List<int> _stack = [];

  bool isEmpty() {
    return _stack.isEmpty;
  }

  void push(int item) {
    _stack.add(item);
  }

  int pop() {
    if (isEmpty()) {
      throw Exception('stack is empty');
    }
    return _stack.removeLast();
  }
}

class StackApp extends StatefulWidget {
  const StackApp({super.key});

  @override
  _StackAppState createState() => _StackAppState();
}

class _StackAppState extends State<StackApp> {
  StackData stack = StackData();
  TextEditingController controller = TextEditingController();

  void addItem() {
    setState(() {
      int number = int.tryParse(controller.text) ?? 0;
      stack.push(number);
      controller.clear();
    });
  }

  void removeItem() {
    setState(() {
      stack.pop();
      controller.clear();

    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Stack DataStructure'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              TextField(
                controller: controller,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Enter a Number',
                ),
              ),
              const SizedBox(height: 16),
              ElevatedButton(onPressed: addItem, child: const Text('push')),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: removeItem,
                child: const Text('pop'),
              ),
              const SizedBox(height: 16),
              Expanded(
                child: ListView.builder(
                    itemCount: stack.isEmpty() ? 0 : stack._stack.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text('Item: ${stack._stack[index]}'),
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
