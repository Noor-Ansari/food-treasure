import 'package:flutter/foundation.dart';

import 'package:fooder/services/service_locator.dart';
import 'package:fooder/services/web_services/category_service/category_service.dart';

import 'package:fooder/business_logic/models/category.dart' as ct;

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
