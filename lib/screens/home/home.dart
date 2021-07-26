import 'package:flutter/material.dart';
import 'package:restaurant_app/CustomNavigationBar/custom_navigation_bar.dart';
import 'package:restaurant_app/screens/home/item_description.dart';

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
List<String> itemImageURL = [
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
    // act similar to listview but in grid
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10.0,
          childAspectRatio: 2.0,
          mainAxisSpacing: 20.0,
        ),
        itemBuilder: (BuildContext context, index) {
          return GridTile(
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed(
                  ItemDescription.routeName,
                  arguments: [
                    itemName[index],
                    itemPrice[index],
                    itemImageURL[index],
                  ],
                );
              },
              child: Image.network(
                itemImageURL[index],
              ),
            ),
            footer: Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(25.0),
                child: Container(
                  width: double.infinity,
                  color: MainColors.blackColor.withOpacity(0.7),
                  child: Center(
                    child: Text(
                      "${itemName[index]} - ${itemPrice[index]}".toUpperCase(),
                      style: TextStyle(
                        color: MainColors.whiteColor,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
        itemCount: itemImageURL.length,
      ),
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
