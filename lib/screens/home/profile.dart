import 'package:flutter/material.dart';
import 'package:restaurant_app/settings/settings.dart';

class Profile extends StatelessWidget {
  late final Function logout;

  Profile({required this.logout});

  @override
  Widget build(BuildContext context) {
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
            onPressed: () => logout(),
            child: Text("Logout"),
          ),
        ],
      ),
    );
  }
}
