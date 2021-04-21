import 'package:flutter/material.dart';
import 'package:todoapps/model/ItemData.dart';

class Data extends ChangeNotifier {
  List<ItemData> _list = [
    ItemData(isChecked: false, image: 'ava3.png', title: 'Item-1'),
    ItemData(isChecked: false, image: 'ava1.png', title: 'Item-2'),
    ItemData(isChecked: false, image: 'ava2.png', title: 'Item-3'),
    ItemData(isChecked: false, image: 'ava3.png', title: 'Item-4'),
    ItemData(isChecked: false, image: 'ava2.png', title: 'Item-5'),
  ];

  List<ItemData> get getAll => _list;

  void addNewItem(String itemName) {
    ItemData newItem =
        ItemData(isChecked: false, image: 'ava1.png', title: itemName);

    _list.add(newItem);
    notifyListeners();
  }
}
