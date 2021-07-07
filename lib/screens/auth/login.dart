import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  final Function login;

  LoginScreen({required this.login});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Restaurant App"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            widget.login();
          },
          child: const Text("Login"),
        ),
      ),
    );
  }
}
