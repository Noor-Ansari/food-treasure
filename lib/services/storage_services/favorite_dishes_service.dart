import 'package:hive/hive.dart';

import 'package:food_treasure/business_logic/models/dish_info.dart';

import 'package:food_treasure/services/storage_services/dish_storage_service.dart';

class FavoriteDishesService extends DishStorageService {
  @override
  Box<DishInfo> getBox() {
    return Hive.box<DishInfo>("favoriteDishes");
  }
}
