import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  final Function(String email, String password) createUser;
  final Function(String email, String password) userSignIn;

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
  GlobalKey<FormState> globalKey = GlobalKey<FormState>();

  late String email;
  late String password;

  // user can choose either want to sign up or sign in
  List<Widget> buildWidget() {
    if (loginOrRegister == LoginOrRegister.login) {
      return [
        ElevatedButton(
          onPressed: () {
            globalKey.currentState?.save();
            widget.userSignIn(email, password);
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
            globalKey.currentState?.save();
            widget.createUser(email, password);
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

  // text form field for sign in
  List<Widget> buildTextField() {
    return [
      TextFormField(
        keyboardType: TextInputType.emailAddress,
        onSaved: (value) => email = value!,
      ),
      TextFormField(
        obscureText: true,
        onSaved: (value) => password = value!,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Restaurant App"),
      ),
      body: Center(
        child: Form(
          key: globalKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: buildTextField() + buildWidget(),
          ),
        ),
      ),
    );
  }
}
