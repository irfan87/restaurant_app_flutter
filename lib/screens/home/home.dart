import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_app/CustomNavigationBar/custom_navigation_bar.dart';

import 'package:restaurant_app/settings/settings.dart';

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

  Widget get profilePage {
    return Center(
      child: Column(
        children: [
          Text(
            "Welcome!",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30.0,
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: MainColors.greenColor,
            ),
            onPressed: () {
              widget.logout();
            },
            child: Text("Logout"),
          ),
        ],
      ),
    );
  }

  Widget get homePage {
    return Center(
      child: Text("Home"),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Restaurant App"),
        elevation: 0.0,
      ),
      body: currentItem == 0 ? homePage : profilePage,
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
