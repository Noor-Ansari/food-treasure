import 'package:flutter/foundation.dart';

import 'package:fooder/business_logic/models/dish.dart';

import 'package:fooder/services/service_locator.dart';
import 'package:fooder/services/web_services/dish_service/dish_service.dart';

class DishesViewModel extends ChangeNotifier {
  String categoryName = "";
  bool loading = false;
  List<Dish> dishes = [];

  final DishService _instance = serviceLocator<DishService>();

  Future<void> loadData(String categoryName) async {
    if (this.categoryName != categoryName) {
      loading = true;
      this.categoryName = categoryName;
      dishes = await _instance.fetchDishes(categoryName);
      loading = false;
      notifyListeners();
    }
  }
}
