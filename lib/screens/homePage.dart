import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoapps/data/data.dart';
import 'package:todoapps/data/item_data.dart';
import 'package:todoapps/model/ItemData.dart';
import 'package:todoapps/widget/ItemWidget.dart';

Widget buildList(BuildContext context) {
  List<ItemData> list =
      Provider.of<ItemCollection>(context).getCollectionAsSteam();

  return Container(
    width: double.infinity,
    height: 560,
    child: ListView.builder(
      itemCount: list.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: TileItem(
            isChecked: list[index].isChecked,
            title: list[index].title,
            image: list[index].image,
            onCheckedChanges: (bool isChecked) {
              Provider.of<ItemCollection>(context).updateItem(
                  list[index].id, isChecked, list[index].title);
            },
          ),
        );
      },
    ),
  );
}
