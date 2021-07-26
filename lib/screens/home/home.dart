import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_app/CustomNavigationBar/custom_navigation_bar.dart';
import 'package:restaurant_app/screens/auth/login.dart';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Restaurant App"),
        elevation: 0.0,
      ),
      body: Center(
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
              // onPressed: () {
              // Widget userLogout;
              // if (widget.logout == true) {
              //   Container();
              // } else {
              //   CircularProgressIndicator();
              // }
              // return userLogout;

              // Navigator.pop(context);
              // },
              child: Text("Logout"),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomNavigationBar(),
    );
  }
}
