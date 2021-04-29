import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ItemCollection extends ChangeNotifier {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  void addItem(String title) {
    _firestore.collection('ItemData').add({
      'title': title,
      'isChecked': false,
    });
  }

  void updateItem(String id, bool isChecked, String title) {
    _firestore.collection('ItemData').doc(id).update({
      'isChecked': isChecked,
      'title': title
    });
  }

  getCollectionAsSteam() => _firestore.collection('ItemData').snapshots();
}
