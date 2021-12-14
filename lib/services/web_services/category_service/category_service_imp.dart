import 'dart:convert';
import "package:http/http.dart";

import 'package:food_treasure/business_logic/models/category.dart';

import 'package:food_treasure/services/web_services/category_service/category_service.dart';

class CategoryServiceImp implements CategoryService {
  @override
  Future<List<Category>> fetchCategories() async {
    try {
      Uri url =
          Uri.parse("https://www.themealdb.com/api/json/v1/1/categories.php");
      Response response = await get(url);
      if (response.statusCode == 200) {
        final Map data = json.decode(response.body);
        List<Category> categories = data["categories"]
            .map<Category>(
              (item) => Category(
                  id: item["idCategory"],
                  name: item["strCategory"],
                  description: item["strCategoryDescription"],
                  image: item["strCategoryThumb"]),
            )
            .toList()
            .where((i) => i.name != "Pork" && i.name != "Goat")
            .toList();
        return categories;
      } else {
        return <Category>[];
      }
    } catch (e) {
      return <Category>[];
    }
  }
}
