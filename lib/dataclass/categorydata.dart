import 'package:flutter/material.dart';

class CategoryData with ChangeNotifier {

  String _selectedOneCategory='Choose Category';

  void chooseCategory(String category)
  {
    _selectedOneCategory=category;
    notifyListeners();
  }
  String get giveCategory {
    return _selectedOneCategory;
  }
}
