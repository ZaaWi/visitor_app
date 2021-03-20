import 'package:flutter/material.dart';


class SearchData extends ChangeNotifier {

  String searchText = '';

  String get typedText {
    return searchText;
  }

  void updateSearchText(String newText) {
    searchText = newText;
    notifyListeners();
  }

}
