import 'package:flutter/material.dart';

class Node {
  int data;
  Node? next;

  Node(this.data);
}

class LinkedList {
  Node? _head;

  // Method to insert a new node at the beginning of the linked list
  void insertAtBeginning(int data) {
    Node newNode = Node(data);
    newNode.next = _head;
    _head = newNode;
  }

  // Method to delete a node with the given key
  void deleteNode(int key) {
    Node? temp = _head;
    Node? prev = null;

    if (temp != null && temp.data == key) {
      _head = temp.next;
      return;
    }

    while (temp != null && temp.data != key) {
      prev = temp;
      temp = temp.next;
    }

    if (temp == null) {
      return;
    }

    prev!.next = temp.next;
  }

  // Method to get the linked list as a list
  List<int> getList() {
    List<int> list = [];
    Node? temp = _head;
    while (temp != null) {
      list.add(temp.data);
      temp = temp.next;
    }
    return list;
  }
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  LinkedList linkedList = LinkedList();
  TextEditingController controller = TextEditingController();
  List<int> elements = [];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Linked List Example'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextField(
                controller: controller,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Enter a number',
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    int number = int.tryParse(controller.text) ?? 0;
                    linkedList.insertAtBeginning(number);
                    controller.clear();
                    elements = linkedList.getList();
                  });
                },
                child: const Text('Add Number'),
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    int number = int.tryParse(controller.text) ?? 0;
                    linkedList.deleteNode(number);
                    controller.clear();
                    elements = linkedList.getList();
                  });
                },
                child: const Text('Delete Number'),
              ),
             const SizedBox(height: 20),
              Expanded(
                child: ListView.builder(
                  itemCount: elements.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text('Element: ${elements[index]}'),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
