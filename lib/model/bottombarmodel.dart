import 'package:flutter/cupertino.dart';

class BottomNavBarModel extends ChangeNotifier {
  int currentIndex = 0;

  void changeIndex(int index) {
    currentIndex = index;
    notifyListeners();
  }
}
