import 'package:flutter/material.dart';
import 'package:mid_eval/provider.dart';
import 'package:mid_eval/sucess_page.dart';
import 'package:provider/provider.dart';


import 'keypad_number.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => CircularTextFieldProvider(),
      child: const MaterialApp(
        home: MyApp(),
      ),
    ),
  );
}

class CircularTextFieldModel {
  String text = '';
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          children: [
            CircularTextField(),
            SizedBox(height: 15),
            Keypad(),
          ],
        ),
      ),
    );
  }
}

class CircularTextField extends StatelessWidget {
  const CircularTextField({super.key});
  @override
  Widget build(BuildContext context) {
    // Obtain the CircularTextFieldProvider from the widget tree
    final provider = Provider.of<CircularTextFieldProvider>(context);

    // Build the UI for the CircularTextField
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 150), // Add margin here
          child: const CircleAvatar(
            radius: 30,
            backgroundImage: AssetImage('assets/images/groww.PNG'),
          ),
        ),
        const SizedBox(height: 18),

        // Display the text 'Enter Groww PIN' with specified styles
        const Text(
          'Enter Groww PIN',
          style: TextStyle(
              fontSize: 21, fontWeight: FontWeight.bold, color: Colors.black54),
        ),
        const SizedBox(height: 18), // Smaller space

        // Display user information in a row (email and logout)
        const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'sai.kalugotla@gmail.com',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: Colors.black54,
              ),
            ),
            SizedBox(width: 5),
            Text(
              'Logout',
              style: TextStyle(
                color: Color.fromARGB(255, 39, 227, 192),
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),

        const SizedBox(height: 20),

        // Generate CircularField widgets based on the CircularTextFieldProvider
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(
            4,
            (index) => CircularField(provider: provider, index: index),
          ),
        ),

        const SizedBox(height: 25),

        // Display 'Use TouchID' text with specified styles
        const Text(
          'Use TouchID',
          style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w800,
              color: Color.fromARGB(255, 39, 227, 192)),
        )
      ],
    );
  }
}

class CircularField extends StatelessWidget {
  // Constructor for CircularField widget
  final CircularTextFieldProvider provider;
  final int index;

  // Constructor with required parameters and calling the super constructor
  const CircularField({required this.provider, required this.index, super.key});

  @override
  Widget build(BuildContext context) {
    // Check if the PIN text is empty or not
    bool isFilled = provider.circularTextFieldModels[index].text.isNotEmpty;

    // Build the UI for CircularField
    return Container(
      width: 25,
      height: 70,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(width: 3.0, color: const Color.fromARGB(255, 71, 98, 91)),
      ),
      child: Center(
        // Show a dot or placeholder if the PIN text is not empty, otherwise show nothing
        child: isFilled ? Container(
          width: 10,
          height: 10,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Color.fromARGB(255, 71, 98, 91),
          ),
        ) : null,
      ),
    );
  }
}


class Keypad extends StatelessWidget {
  const Keypad({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CircularTextFieldProvider>(context);

    return Column(
      children: [
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            KeypadNumber(number: '1'),
            KeypadNumber(number: '2'),
            KeypadNumber(number: '3'),
          ],
        ),
        const SizedBox(height: 20),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            KeypadNumber(number: '4'),
            KeypadNumber(number: '5'),
            KeypadNumber(number: '6'),
          ],
        ),
        const SizedBox(height: 20),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            KeypadNumber(number: '7'),
            KeypadNumber(number: '8'),
            KeypadNumber(number: '9'),
          ],
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              onPressed: () {
                provider.clearText();
              },
              icon: const Icon(Icons.cancel_outlined),
              color: const Color.fromARGB(255, 39, 227, 192),
            ),
            const KeypadNumber(number: '0'),
            IconButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const SuccessPage(),
                  ),
                );
                // Implement functionality for the correct button
              },
              icon: const Icon(Icons.verified_user),
              color: const Color.fromARGB(255, 39, 227, 192),
            ),
          ],
        ),
      ],
    );
  }
}