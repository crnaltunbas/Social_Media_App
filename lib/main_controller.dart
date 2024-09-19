import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

class MainController extends ChangeNotifier {
  PersistentTabController bottomBarController =
      PersistentTabController(initialIndex: 0);

  int currentIndex = 0;

  void changePage(int index) {
    currentIndex = index;
    bottomBarController.jumpToTab(index); // Sayfa geçişini burada yönetiyoruz
    notifyListeners();
  }
}
