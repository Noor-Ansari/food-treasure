import 'package:flutter/foundation.dart';

import 'package:food_treasure/business_logic/models/dish_info.dart';

import 'package:food_treasure/services/service_locator.dart';
import 'package:food_treasure/services/storage_services/favorite_dishes_service.dart';

class FavoriteDishesViewModel extends ChangeNotifier {
  List<DishInfo> favoriteDishes = [];

  final FavoriteDishesService _instance =
      serviceLocator<FavoriteDishesService>();

  void loadData() {
    favoriteDishes = _instance.getDishes();
  }

  void addToFavorites(DishInfo dish) async {
    await _instance.addDish(dish);
    favoriteDishes = _instance.getDishes();
    notifyListeners();
  }

  void removeFromFavorites(DishInfo dish) async {
    await _instance.removeDish(dish);
    favoriteDishes = _instance.getDishes();
    notifyListeners();
  }
}
