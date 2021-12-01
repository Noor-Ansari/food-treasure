import 'package:flutter/foundation.dart';

import 'package:fooder/business_logic/models/dish_info.dart';

import 'package:fooder/services/service_locator.dart';
import 'package:fooder/services/web_services/dish_service/dish_service.dart';

class DishInfoViewModel extends ChangeNotifier {
  DishInfo dishInfo =
      DishInfo(name: "", image: "", recipee: "", videoRef: "", ingredients: []);
  bool loading = false;

  final DishService _instance = serviceLocator<DishService>();

  Future<void> loadData(String dishId) async {
    loading = true;
    dishInfo = await _instance.fetchDishInfo(dishId);
    loading = false;
    notifyListeners();
  }
}
