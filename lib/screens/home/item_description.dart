import 'package:flutter/material.dart';

class ItemDescription extends StatefulWidget {
  static const routeName = '/item-description';
  @override
  _ItemDescriptionState createState() => _ItemDescriptionState();
}

class _ItemDescriptionState extends State<ItemDescription> {
  @override
  Widget build(BuildContext context) {
    // ModalRoute.of masked as List<dynamic>
    // refer to https://stackoverflow.com/questions/66522828/a-value-of-type-object-cant-be-assigned-to-a-variable-of-type-mapdynamic
    final List<dynamic> arguments =
        ModalRoute.of(context)?.settings.arguments as List<dynamic>;
    final itemName = arguments[0];
    final itemPrice = arguments[1];
    final itemImage = arguments[2];

    return Scaffold(
      appBar: AppBar(
        title: Text("${itemName}'s Description"),
        elevation: 0.0,
      ),
      body: Column(
        children: [
          Image.network(
            itemImage,
            fit: BoxFit.fill,
          ),
          Text(itemPrice.toString()),
        ],
      ),
    );
  }
}
