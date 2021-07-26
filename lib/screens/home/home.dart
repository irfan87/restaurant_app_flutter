import 'package:flutter/material.dart';
import 'package:restaurant_app/CustomNavigationBar/custom_navigation_bar.dart';
import 'package:restaurant_app/screens/home/items_list.dart';
import 'package:restaurant_app/screens/home/profile.dart';

class HomeScreen extends StatefulWidget {
  late final Function logout;

  HomeScreen({
    Key? key,
    required this.logout,
  }) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentItem = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Restaurant App"),
        elevation: 0.0,
      ),
      body: currentItem == 0
          ? ItemsList()
          : Profile(
              logout: () => widget.logout(),
            ),
      bottomNavigationBar: CustomNavigationBar(
        currentSelectedItem: (value) {
          setState(() {
            currentItem = value;
          });
        },
      ),
    );
  }
}
