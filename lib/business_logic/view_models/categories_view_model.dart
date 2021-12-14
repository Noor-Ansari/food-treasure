import 'package:flutter/foundation.dart';

import 'package:food_treasure/services/service_locator.dart';
import 'package:food_treasure/services/web_services/category_service/category_service.dart';

import 'package:food_treasure/business_logic/models/category.dart' as ct;

class CategoriesViewModel extends ChangeNotifier {
  bool loading = false;
  List<ct.Category> categories = [];
  final CategoryService _instance = serviceLocator<CategoryService>();

  Future<void> loadData() async {
    loading = true;
    categories = await _instance.fetchCategories();
    loading = false;
    notifyListeners();
  }
}
