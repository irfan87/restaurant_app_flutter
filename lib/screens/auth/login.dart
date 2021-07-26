import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_app/settings/settings.dart';

class LoginScreen extends StatefulWidget {
  final Function(String email, String password) createUser;
  final Function(String email, String password) userSignIn;

  // ignore: prefer_const_constructors_in_immutables
  LoginScreen({
    Key? key,
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
  bool _hidePassword = false;

  @override
  void initState() {
    super.initState();
    _hidePassword = !_hidePassword;
  }

  @override
  void dispose() {
    super.dispose();
    email = "";
    password = "";
  }

  // text form field for sign in
  Widget buildTextField() {
    return Column(
      children: [
        TextFormField(
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            hintText: "Email Address",
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
            hintText: "Password",
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
        const SizedBox(
          height: 20.0,
        ),
      ],
    );
  }

  // user can choose either want to sign up or sign in
  Widget buildButtonWidget(BuildContext context) {
    if (loginOrRegister == LoginOrRegister.login) {
      return Column(
        children: [
          TextButton(
            onPressed: () {
              globalKey.currentState!.save();
              widget.userSignIn(email, password);
            },
            child: Text(
              'Sign In',
              style: TextStyle(
                color: MainColors.whiteColor,
              ),
            ),
            style: TextButton.styleFrom(
              backgroundColor: MainColors.greenColor,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Not a member yet?"),
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
        ],
      );
    } else {
      return Column(
        children: [
          TextButton(
            onPressed: () {
              globalKey.currentState!.save();
              widget.createUser(email, password);
            },
            child: Text(
              'Register',
              style: TextStyle(color: MainColors.whiteColor),
            ),
            style: TextButton.styleFrom(
              backgroundColor: MainColors.greenColor,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Already a member? Click to "),
              TextButton(
                onPressed: () {
                  setState(() {
                    loginOrRegister = LoginOrRegister.login;
                  });
                },
                child: const Text("Sign in"),
              ),
            ],
          ),
        ],
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
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
                children: [buildTextField(), buildButtonWidget(context)],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
