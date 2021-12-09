import 'package:hive/hive.dart';

import 'package:fooder/business_logic/models/dish_info.dart';

abstract class DishStorageService {
  Future<void> addDish(DishInfo newDish) async {
    final dishes = getDishes();
    final box = getBox();
    final isExist = dishes.any((dish) => dish.name == newDish.name);
    if (!isExist) {
      await box.add(newDish);
    }
  }

  Future<void> removeDish(DishInfo dish) async {
    List<DishInfo> dishes = getDishes();
    final box = getBox();
    int position = dishes.indexOf(dish);
    if (position != -1) {
      box.deleteAt(position);
    }
  }

  List<DishInfo> getDishes() {
    final box = getBox();
    return box.values.toList();
  }

  void clearDishes() {
    final box = getBox();
    box.clear();
  }

// the subclass will provide the implementation for this method
  Box<DishInfo> getBox();
}
