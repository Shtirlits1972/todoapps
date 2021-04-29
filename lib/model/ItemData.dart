import 'package:flutter/foundation.dart';

class ItemData {
  String id;
  bool isChecked;
  String image;
  String title;

  ItemData({ this.id, this.isChecked, this.image, @required this.title});
}