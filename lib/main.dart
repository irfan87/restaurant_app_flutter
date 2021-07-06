import 'package:flutter/material.dart';
import 'package:restaurant_app/screens/widget_tree.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Restaurant App",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: WidgetTree(),
    );
  }
}
