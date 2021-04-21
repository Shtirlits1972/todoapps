import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoapps/data/data.dart';
import 'package:todoapps/model/ItemData.dart';
import 'package:todoapps/widget/ItemWidget.dart';

Widget buildList(BuildContext context) {
  
List<ItemData> list = Provider.of<Data>(context).getAll;

  return Container(
    width: double.infinity,
    height: 560,
    child: ListView.builder(
      itemCount: list.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: TileItemWidget(
            itemData: list[index],
          ),
        );
      },
    ),
  );
}
