import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_app/AuthService/auth_service.dart';
import 'package:restaurant_app/screens/auth/login.dart';
import 'package:restaurant_app/screens/home/home.dart';

class WidgetTree extends StatefulWidget {
  final AuthAction authAction;

  WidgetTree({required this.authAction});

  @override
  _WidgetTreeState createState() => _WidgetTreeState();
}

enum AuthResult {
  isLogin,
  isNotLogin,
}

class _WidgetTreeState extends State<WidgetTree> {
  User? user;
  AuthResult authResult = AuthResult.isNotLogin;

  @override
  void initState() {
    try {
      widget.authAction.currentUser().then((currUser) {
        setState(() {
          user = currUser;

          authResult =
              user != null ? AuthResult.isLogin : AuthResult.isNotLogin;
        });
      });
    } catch (e) {
      print(e);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    switch (authResult) {
      case AuthResult.isLogin:
        return HomeScreen(
          logout: () async {
            user = await widget.authAction.userLogout();
            authResult = AuthResult.isNotLogin;
            setState(() {});
          },
        );
      case AuthResult.isNotLogin:
        return LoginScreen(
          login: () async {
            user = await widget.authAction.signInAnon();
            authResult = AuthResult.isLogin;
            setState(() {});
          },
          createUser: () async {
            await widget.authAction.createUser().then(
              (currUser) {
                if (currUser != null) {
                  user = currUser;
                  authResult = AuthResult.isLogin;
                  setState(() {});
                }
              },
            );
          },
        );
    }
  }
}
