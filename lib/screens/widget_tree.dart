import 'package:flutter/material.dart';
import 'package:restaurant_app/screens/auth/login.dart';

class WidgetTree extends StatefulWidget {
  @override
  _WidgetTreeState createState() => _WidgetTreeState();
}

class _WidgetTreeState extends State<WidgetTree> {
  @override
  Widget build(BuildContext context) {
    return LoginScreen();
  }
}
