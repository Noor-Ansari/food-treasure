import 'package:flutter/foundation.dart';

import 'package:food_treasure/business_logic/models/dish_info.dart';

import 'package:food_treasure/services/service_locator.dart';
import 'package:food_treasure/services/storage_services/favorite_dishes_service.dart';
import 'package:food_treasure/services/web_services/dish_service/dish_service.dart';

class DishInfoViewModel extends ChangeNotifier {
  String dishName = "";
  DishInfo dishInfo = DishInfo.empty();
  bool loading = false;
  bool noData = false;

  final DishService _dishService = serviceLocator<DishService>();
  final FavoriteDishesService _favoriteDishService =
      serviceLocator<FavoriteDishesService>();

  Future<void> loadData(String dishName) async {
    if (this.dishName != dishName) {
      loading = true;
      this.dishName = dishName;
      var data = await _dishService.fetchDishInfo(dishName);
      dishInfo = data.first;
      loading = false;
      if (dishInfo.ingredients.isEmpty) {
        noData = true;
      }
      notifyListeners();
    }
  }

  bool isFavorite() {
    return _favoriteDishService
        .getDishes()
        .any((dish) => dish.name == dishInfo.name);
  }
}
