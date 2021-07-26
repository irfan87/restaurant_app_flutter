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

//TODO: global item list strings(?)
List<String> itemName = [
  'apple',
  'orange',
  'eggs',
  'milk',
  'bread',
  'cake',
];

//TODO: global item description
List<double> itemPrice = [
  1.00,
  2.40,
  1.50,
  2.00,
  1.50,
  1.00,
];

//TODO: global item URL image
List<String> itemImage = [
  'https://blogs-images.forbes.com/bethhoffman/files/2012/04/Apple.jpg',
  'https://upload.wikimedia.org/wikipedia/commons/c/c4/Orange-Fruit-Pieces.jpg',
  'https://solidstarts.com/wp-content/uploads/when-can-babies-eat-eggs.jpg',
  'https://cdn.britannica.com/34/176234-050-0E0C55C6/Glass-milk.jpg',
  'https://bakingamoment.com/wp-content/uploads/2020/01/IMG_7173-white-bread-2.jpg',
  'https://preppykitchen.com/wp-content/uploads/2018/04/Funfetti-cake-recipe-new-500x500.jpg'
];

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
