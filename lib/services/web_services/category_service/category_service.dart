import 'package:food_treasure/business_logic/models/category.dart';

abstract class CategoryService {
  Future<List<Category>> fetchCategories();
}
