import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:fooder/ui/screens/dish_info.dart' as ui;

import 'package:fooder/business_logic/models/dish_info.dart';

import 'package:fooder/services/service_locator.dart';
import 'package:fooder/services/web_services/dish_service/dish_service.dart';

class CustomSearchViewModel extends ChangeNotifier {
  final List<DishInfo> searchHistory = [];
  final DishService _service = serviceLocator<DishService>();
  List<DishInfo> searchData = [];
  String query = "";

  void loadData(String query) {
    if (this.query == query ||
        (query.toLowerCase().contains(this.query.toLowerCase()) &&
            this.query.isNotEmpty) ||
        query.isEmpty) {
      return;
    }
    this.query = query;
    _service.fetchDishInfo(query).then((data) {
      searchData = data;
      notifyListeners();
    });
  }

  void handleItemSelected(BuildContext context, DishInfo selectedItem) {
    if (!searchHistory.contains(selectedItem)) {
      searchHistory.insert(0, selectedItem);
    }
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) =>
            ui.DishInfo(name: selectedItem.name, image: selectedItem.image),
      ),
    );
  }

  List<DishInfo> filterSuggestions(String query) {
    return searchData
        .where(
            (item) => item.name.toLowerCase().startsWith(query.toLowerCase()))
        .toList();
  }

  List<DishInfo> filterResults(String query) {
    return searchData
        .where((item) => item.name.toLowerCase() == query.toLowerCase())
        .toList();
  }
}
