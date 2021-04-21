import 'package:flutter/material.dart';

class DetailedScreen extends StatelessWidget {
  const DetailedScreen({Key key, this.itemText}) : super(key: key);

  final String itemText;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DetailedScreen'),
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(8.0),
          alignment: Alignment.topLeft,
          child: Hero(
            tag: 'flippers',
            child: SizedBox(
              width: 300.0,
              child: Text(
                itemText,
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.redAccent),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
