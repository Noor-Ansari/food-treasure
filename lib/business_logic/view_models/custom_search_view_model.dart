import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:food_treasure/ui/screens/dish_info.dart' as ui;

import 'package:food_treasure/business_logic/models/dish_info.dart';

import 'package:food_treasure/services/service_locator.dart';
import 'package:food_treasure/services/web_services/dish_service/dish_service.dart';
import 'package:food_treasure/services/storage_services/search_history_service.dart';

class CustomSearchViewModel extends ChangeNotifier {
  final DishService _dishService = serviceLocator<DishService>();
  final SearchHistoryService _searchHistoryService =
      serviceLocator<SearchHistoryService>();
  List<DishInfo> searchHistory = [];
  List<DishInfo> searchData = [];
  String query = "";

  void loadData(String query) {
    if (this.query == query ||
        (query.toLowerCase().contains(this.query.toLowerCase()) &&
            this.query.isNotEmpty) ||
        query.isEmpty) {
      searchHistory = _searchHistoryService.getDishes();
      return;
    }
    this.query = query;
    _dishService.fetchDishInfo(query).then((data) {
      searchData = data;
      notifyListeners();
    });
  }

  void handleItemSelected(BuildContext context, DishInfo selectedItem) {
    _searchHistoryService.addDish(selectedItem);
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

  void clearSearchHistory() {
    _searchHistoryService.clearDishes();
    notifyListeners();
  }
}
