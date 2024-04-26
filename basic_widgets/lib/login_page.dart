import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LoginPage extends StatelessWidget {
  final MethodChannel _channel = const MethodChannel('login_channel');

  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Page'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            _channel.invokeMethod('startLoginActivity');
          },
          child: const Text('Open Login Activity'),
        ),
      ),
    );
  }
}
