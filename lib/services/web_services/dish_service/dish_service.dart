import 'package:food_treasure/business_logic/models/dish.dart';
import 'package:food_treasure/business_logic/models/dish_info.dart';

abstract class DishService {
  Future<List<Dish>> fetchDishes(String categoryName);
  Future<List<DishInfo>> fetchDishInfo(String dishName);
}
