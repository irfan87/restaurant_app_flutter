import 'package:flutter/material.dart';

class ItemDescription extends StatefulWidget {
  static const routeName = '/item-description';
  @override
  _ItemDescriptionState createState() => _ItemDescriptionState();
}

class _ItemDescriptionState extends State<ItemDescription> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Description'),
      ),
      body: Text('description page'),
    );
  }
}
