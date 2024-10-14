import 'package:flutter/cupertino.dart';

class SearchProvider extends ChangeNotifier{
  String search = "";

  void changeCategory(String search){
    this.search = search;
    notifyListeners();
  }
}