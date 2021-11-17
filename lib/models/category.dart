import 'dart:convert';
import "package:http/http.dart";
import "./dish.dart";

class Category {
  final String id;
  final String name;
  final String image;
  final String description;
  List<Dish> dishes = [];

  Category(
      {required this.id,
      required this.name,
      required this.description,
      required this.image});

  Future<void> getDishes() async {
    Uri url =
        Uri.parse('https://www.themealdb.com/api/json/v1/1/filter.php?c=$name');
    Response response = await get(url);
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      dishes = DishesResponse.fromJSON(data["meals"]).dishes;
    }
  }
}

class CategoriesResponse {
  List<Category> categories = [];

  Future fetchData() async {
    Uri url =
        Uri.parse("https://www.themealdb.com/api/json/v1/1/categories.php");
    Response response = await get(url);
    if (response.statusCode == 200) {
      final Map data = json.decode(response.body);
      categories = data["categories"]
          .map<Category>(
            (item) => Category(
                id: item["idCategory"],
                name: item["strCategory"],
                description: item["strCategoryDescription"],
                image: item["strCategoryThumb"]),
          )
          .toList();
    }
  }
}
