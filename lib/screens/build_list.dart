import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoapps/data/item_data.dart';
import '../widget/ItemWidget.dart';

Widget BuildItemWidget(BuildContext context) {
  return Container(
    child: StreamBuilder(
      stream: Provider.of<ItemCollection>(context).getCollectionAsSteam(),
      builder: (BuildContext context, AsyncSnapshot<dynamic> asyncSnapshot) {
        if (!asyncSnapshot.hasData) {
          return Center(
            child: Text('Loading....'),
          );
        }

        List<Widget> todoWidgets = [];
        asyncSnapshot.data.docs.forEach((DocumentSnapshot docs) {
          final id = docs.id;

          bool  isSelected = docs.data()['isChecked'];
          String title = docs.data()['title'];

          final item = TileItem(
            isChecked: isSelected,
            title: title,
            image: 'ava2.png',
            onCheckedChanges: (bool isSelected2) {
              Provider.of<ItemCollection>(context, listen: false)
                  .updateItem(id, isSelected2, title);
            },
          );

          todoWidgets.add(item);
        });

        return ListView(
          children: todoWidgets,
        );
      },
    ),
  );
}
