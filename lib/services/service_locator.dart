import 'package:get_it/get_it.dart';

import 'package:food_treasure/business_logic/view_models/categories_view_model.dart';
import 'package:food_treasure/business_logic/view_models/dish_info_view_model.dart';
import 'package:food_treasure/business_logic/view_models/dishes_view_model.dart';
import 'package:food_treasure/business_logic/view_models/bottom_navbar_view_model.dart';
import 'package:food_treasure/business_logic/view_models/custom_search_view_model.dart';
import 'package:food_treasure/business_logic/view_models/favorite_dishes_view_model.dart';

import 'package:food_treasure/services/web_services/category_service/category_service.dart';
import 'package:food_treasure/services/web_services/category_service/category_service_imp.dart';
import 'package:food_treasure/services/web_services/dish_service/dish_service.dart';
import 'package:food_treasure/services/web_services/dish_service/dish_service_imp.dart';
import 'package:food_treasure/services/storage_services/favorite_dishes_service.dart';
import 'package:food_treasure/services/storage_services/search_history_service.dart';

final serviceLocator = GetIt.instance;

void setup() {
  serviceLocator
      .registerLazySingleton<CategoryService>(() => CategoryServiceImp());
  serviceLocator.registerLazySingleton<DishService>(() => DishServiceImp());
  serviceLocator.registerLazySingleton<FavoriteDishesService>(
      () => FavoriteDishesService());
  serviceLocator.registerLazySingleton<SearchHistoryService>(
      () => SearchHistoryService());

  serviceLocator.registerFactory(() => CategoriesViewModel());
  serviceLocator.registerFactory(() => DishesViewModel());
  serviceLocator.registerFactory(() => DishInfoViewModel());
  serviceLocator.registerFactory(() => BottomNabarViewModel());
  serviceLocator.registerFactory(() => CustomSearchViewModel());
  serviceLocator.registerFactory(() => FavoriteDishesViewModel());
}
