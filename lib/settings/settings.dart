// all the settings for the app will implement here
import 'package:flutter/material.dart';

class MainColors {
  static const primaryColor = Color.fromRGBO(224, 224, 224, 1.0);
  static const secondaryColor = Colors.brown;
  static const whiteColor = Colors.white;
  static const blackColor = Colors.black;
  static const greenColor = Colors.green;
}

// settings for elevated button
class CustomButton extends StatelessWidget {
  final Color color;
  final String text;
  final Function function;

  const CustomButton({
    Key? key,
    required this.color,
    required this.text,
    required this.function,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: function(),
      child: Text(
        text,
        style: const TextStyle(
          color: MainColors.whiteColor,
        ),
      ),
      style: ButtonStyle(
        elevation: MaterialStateProperty.all(2.0),
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
