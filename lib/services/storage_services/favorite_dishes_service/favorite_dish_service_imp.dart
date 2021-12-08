import 'package:hive/hive.dart';

import 'package:fooder/business_logic/models/dish_info.dart';

import 'package:fooder/services/storage_services/favorite_dishes_service/favorite_dish_service.dart';

class FavoriteDishServiceImp extends FavoriteDishService {
  late final Box<DishInfo> box;

  FavoriteDishServiceImp() {
    box = Hive.box<DishInfo>("favoriteDishes");
  }

  @override
  Future<void> addDish(DishInfo dish) async {
    await box.add(dish);
  }

  @override
  Future<void> removeDish(DishInfo dish) async {
    List<DishInfo> dishes = getDishes();
    int position = dishes.indexOf(dish);
    if (position != -1) {
      box.deleteAt(position);
    }
  }

  @override
  bool isFavorite(DishInfo dish) {
    return box.values.toList().contains(dish);
  }

  @override
  List<DishInfo> getDishes() {
    return box.values.toList();
  }
}
