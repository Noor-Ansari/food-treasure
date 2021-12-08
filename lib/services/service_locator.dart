import 'package:fooder/business_logic/view_models/favorite_dishes_view_model.dart';
import 'package:fooder/services/storage_services/favorite_dishes_service/favorite_dish_service.dart';
import 'package:fooder/services/storage_services/favorite_dishes_service/favorite_dish_service_imp.dart';
import 'package:get_it/get_it.dart';

import 'package:fooder/business_logic/view_models/categories_view_model.dart';
import 'package:fooder/business_logic/view_models/dish_info_view_model.dart';
import 'package:fooder/business_logic/view_models/dishes_view_model.dart';
import 'package:fooder/business_logic/view_models/bottom_navbar_view_model.dart';
import 'package:fooder/business_logic/view_models/custom_search_view_model.dart';

import 'package:fooder/services/web_services/category_service/category_service.dart';
import 'package:fooder/services/web_services/category_service/category_service_imp.dart';
import 'package:fooder/services/web_services/dish_service/dish_service.dart';
import 'package:fooder/services/web_services/dish_service/dish_service_imp.dart';

final serviceLocator = GetIt.instance;

void setup() {
  serviceLocator
      .registerLazySingleton<CategoryService>(() => CategoryServiceImp());
  serviceLocator.registerLazySingleton<DishService>(() => DishServiceImp());
  serviceLocator.registerLazySingleton<FavoriteDishService>(
      () => FavoriteDishServiceImp());

  serviceLocator.registerFactory(() => CategoriesViewModel());
  serviceLocator.registerFactory(() => DishesViewModel());
  serviceLocator.registerFactory(() => DishInfoViewModel());
  serviceLocator.registerFactory(() => BottomNabarViewModel());
  serviceLocator.registerFactory(() => CustomSearchViewModel());
  serviceLocator.registerFactory(() => FavoriteDishesViewModel());
}
