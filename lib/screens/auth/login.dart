import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  final Function createUser;
  final Function userSignIn;

  LoginScreen({
    required this.createUser,
    required this.userSignIn,
  });

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

enum LoginOrRegister {
  login,
  register,
}

class _LoginScreenState extends State<LoginScreen> {
  LoginOrRegister loginOrRegister = LoginOrRegister.login;

  List<Widget> buildWidget() {
    if (loginOrRegister == LoginOrRegister.login) {
      return [
        ElevatedButton(
          onPressed: () {
            widget.userSignIn();
          },
          child: const Text("Sign in"),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Not a member yet?"),
            TextButton(
              onPressed: () {
                setState(() {
                  loginOrRegister = LoginOrRegister.register;
                });
              },
              child: const Text("Register here"),
            ),
          ],
        ),
      ];
    } else {
      return [
        ElevatedButton(
          onPressed: () {
            widget.createUser();
          },
          child: const Text("Create new user"),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Already a member? Click to "),
            TextButton(
              onPressed: () {
                setState(() {
                  loginOrRegister = LoginOrRegister.login;
                });
              },
              child: const Text("Sign in"),
            ),
          ],
        )
      ];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Restaurant App"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: buildWidget(),
        ),
      ),
    );
  }
}
