import 'package:flutter/material.dart';
import 'package:restaurant_app/settings/settings.dart';

class CustomNavigationBar extends StatefulWidget {
  final Function(int) currentSelectedItem;

  const CustomNavigationBar({Key? key, required this.currentSelectedItem})
      : super(key: key);

  @override
  _CustomNavigationBarState createState() => _CustomNavigationBarState();
}

class _CustomNavigationBarState extends State<CustomNavigationBar> {
  int selectedItem = 0;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      selectedItemColor: MainColors.greenColor,
      items: [
        BottomNavigationBarItem(
          icon: Icon(
            Icons.home,
          ),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.account_circle,
          ),
          label: 'Profile',
        ),
      ],
      currentIndex: selectedItem,
      onTap: (currItem) {
        setState(() {
          selectedItem = currItem;
          widget.currentSelectedItem(currItem);
        });
      },
    );
  }
}
