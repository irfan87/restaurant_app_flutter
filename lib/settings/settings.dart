// all the settings for the app will implement here
import 'package:flutter/material.dart';

class MainColors {
  static const primaryColor = Colors.green;
  static const secondaryColor = Colors.brown;
  static const whiteColor = Colors.white;
  static const blackColor = Colors.black;
}

// settings for elevated button
class CustomButton extends StatelessWidget {
  final Color color;
  final String text;
  final Function onPress;

  const CustomButton({
    Key? key,
    required this.color,
    required this.text,
    required this.onPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPress(),
      child: Text(
        text,
        style: const TextStyle(
          color: MainColors.whiteColor,
        ),
      ),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(color),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25.0),
          ),
        ),
      ),
    );
  }
}
