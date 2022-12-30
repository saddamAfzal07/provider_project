import 'package:flutter/material.dart';

class AppFavorite extends ChangeNotifier {
  List<int> selectedIndex = [];

  void addItem(int value) {
    print("add item");
    selectedIndex.add(value);
    print(selectedIndex);
    notifyListeners();
  }

  void removeItem(int value) {
    print("remove item");
    selectedIndex.remove(value);
    print(selectedIndex);
    notifyListeners();
  }
}
