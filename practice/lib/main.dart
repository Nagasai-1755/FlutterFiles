import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final FocusNode _focusNode = FocusNode();
    final TextEditingController _controller = TextEditingController();

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Circular TextField Example'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularTextField(
                controller: _controller,
                focusNode: _focusNode,
              ),
              SizedBox(height: 20),
              NumberPad(focusNode: _focusNode, controller: _controller),
            ],
          ),
        ),
      ),
    );
  }
}

class CircularTextField extends StatefulWidget {
  final TextEditingController controller;
  final FocusNode focusNode;
  final int maxLength;

  CircularTextField({required this.controller, required this.focusNode, this.maxLength = 1});

  @override
  _CircularTextFieldState createState() => _CircularTextFieldState();
}

class _CircularTextFieldState extends State<CircularTextField> {
  @override
  void initState() {
    super.initState();
    widget.focusNode.addListener(_handleFocusChange);
  }

  @override
  void dispose() {
    widget.focusNode.removeListener(_handleFocusChange);
    super.dispose();
  }

  void _handleFocusChange() {
    if (widget.focusNode.hasFocus) {
      setState(() {
        widget.controller.text = '';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200, // Set width to provide some constraints
      height: 50,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: widget.focusNode.hasFocus ? Colors.blue : Colors.grey),
      ),
      child: TextField(
        controller: widget.controller,
        focusNode: widget.focusNode,
        textAlign: TextAlign.center,
        maxLength: widget.maxLength,
        onChanged: (value) {
          if (value.length == widget.maxLength) {
            FocusScope.of(context).nextFocus();
          }
        },
        onTap: () {
          widget.focusNode.requestFocus();
        },
        onEditingComplete: () {
          widget.focusNode.unfocus();
        },
        decoration: InputDecoration(
          border: InputBorder.none,
          counter: Offstage(),
        ),
      ),
    );
  }
}

class NumberPad extends StatelessWidget {
  final FocusNode focusNode;
  final TextEditingController controller;

  NumberPad({required this.focusNode, required this.controller});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 3,
      children: List.generate(10, (index) {
        return InkWell(
          onTap: () {
            if (index == 0) {
              controller.text = '0';
            } else {
              controller.text = index.toString();
            }
            focusNode.requestFocus();
          },
          child: Container(
            alignment: Alignment.center,
            child: Text(
              index.toString(),
              style: TextStyle(fontSize: 24),
            ),
          ),
        );
      }),
    );
  }
}
