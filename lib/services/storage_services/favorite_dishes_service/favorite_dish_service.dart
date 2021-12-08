import 'package:fooder/business_logic/models/dish_info.dart';

abstract class FavoriteDishService {
  Future<void> addDish(DishInfo dish);
  Future<void> removeDish(DishInfo dish);
  List<DishInfo> getDishes();
  bool isFavorite(DishInfo dish);
}
