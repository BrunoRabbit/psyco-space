import 'package:flutter/material.dart';

class FormController extends ChangeNotifier {
  int index = 0;
  String actualStateUF = 'SP';

  void changeIndex() {
    index++;
    notifyListeners();
  }
}
