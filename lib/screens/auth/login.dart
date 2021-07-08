import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  final Function login;
  final Function createUser;
  final Function userSignIn;

  LoginScreen({
    required this.login,
    required this.createUser,
    required this.userSignIn,
  });

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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                widget.login();
              },
              child: const Text("Login as anon"),
            ),
            ElevatedButton(
              onPressed: () {
                widget.userSignIn();
              },
              child: const Text("Sign in"),
            ),
            ElevatedButton(
              onPressed: () {
                widget.createUser();
              },
              child: const Text("Create new user"),
            ),
          ],
        ),
      ),
    );
  }
}
