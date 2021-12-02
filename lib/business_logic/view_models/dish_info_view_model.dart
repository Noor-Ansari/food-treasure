import 'package:flutter/foundation.dart';

import 'package:fooder/business_logic/models/dish_info.dart';

import 'package:fooder/services/service_locator.dart';
import 'package:fooder/services/web_services/dish_service/dish_service.dart';

class DishInfoViewModel extends ChangeNotifier {
  String dishId = "";
  DishInfo dishInfo = DishInfo.empty();
  bool loading = false;
  bool noData = false;

  final DishService _instance = serviceLocator<DishService>();

  Future<void> loadData(String dishId) async {
    if (this.dishId != dishId) {
      loading = true;
      this.dishId = dishId;
      dishInfo = await _instance.fetchDishInfo(dishId);
      loading = false;
      if (dishInfo.ingredients.isEmpty) {
        noData = true;
      }
      notifyListeners();
    }
  }
}
