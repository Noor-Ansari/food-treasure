import 'package:flutter/foundation.dart';

import 'package:fooder/business_logic/models/dish_info.dart';

import 'package:fooder/services/service_locator.dart';
import 'package:fooder/services/web_services/dish_service/dish_service.dart';

class DishInfoViewModel extends ChangeNotifier {
  String dishName = "";
  DishInfo dishInfo = DishInfo.empty();
  bool loading = false;
  bool noData = false;

  final DishService _instance = serviceLocator<DishService>();

  Future<void> loadData(String dishName) async {
    if (this.dishName != dishName) {
      loading = true;
      this.dishName = dishName;
      var data = await _instance.fetchDishInfo(dishName);
      dishInfo = data.first;
      loading = false;
      if (dishInfo.ingredients.isEmpty) {
        noData = true;
      }
      notifyListeners();
    }
  }
}
