import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_app/settings/settings.dart';

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
  bool _hidePassword = true;

  @override
  void initState() {
    super.initState();
    _hidePassword = false;
  }

  // user can choose either want to sign up or sign in
  List<Widget> buildWidget() {
    if (loginOrRegister == LoginOrRegister.login) {
      return [
        CustomButton(
          color: MainColors.primaryColor,
          text: "Sign in",
          onPress: () {
            globalKey.currentState?.save();
            widget.userSignIn(email, password);
          },
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
        CustomButton(
          color: MainColors.primaryColor,
          text: "Create new user",
          onPress: () {
            globalKey.currentState?.save();
            widget.createUser(email, password);
          },
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
        decoration: InputDecoration(
          labelText: "Email Address",
          fillColor: MainColors.whiteColor,
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25.0),
          ),
        ),
        onSaved: (value) => email = value!,
      ),
      const SizedBox(
        height: 5.0,
      ),
      TextFormField(
        obscureText: _hidePassword,
        decoration: InputDecoration(
          labelText: "Password",
          fillColor: MainColors.whiteColor,
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25.0),
          ),
          suffixIcon: IconButton(
            icon: _hidePassword == true
                ? const Icon(Icons.lock)
                : const Icon(Icons.lock_open),
            onPressed: () {
              setState(() {
                _hidePassword = !_hidePassword;
              });
            },
          ),
        ),
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
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(
              left: 20.0,
              bottom: 80.0,
              top: 20.0,
              right: 20.0,
            ),
            child: Form(
              key: globalKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: buildTextField() + buildWidget(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
