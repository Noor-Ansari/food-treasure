import 'package:flutter/foundation.dart';

import 'package:fooder/business_logic/models/dish_info.dart';

import 'package:fooder/services/service_locator.dart';
import 'package:fooder/services/storage_services/favorite_dishes_service/favorite_dish_service.dart';

class FavoriteDishesViewModel extends ChangeNotifier {
  List<DishInfo> favoriteDishes = [];

  final FavoriteDishService _instance = serviceLocator<FavoriteDishService>();

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
