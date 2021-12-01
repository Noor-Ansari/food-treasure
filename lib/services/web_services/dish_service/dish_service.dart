import 'package:fooder/business_logic/models/dish.dart';
import 'package:fooder/business_logic/models/dish_info.dart';

abstract class DishService {
  Future<List<Dish>> fetchDishes(String categoryName);
  Future<DishInfo> fetchDishInfo(String dishId);
}
