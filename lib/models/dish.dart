import "package:http/http.dart";
import "dart:convert";

class DishesResponse {
  List<Dish> dishes = [];

  DishesResponse.fromJSON(List<dynamic> json) {
    dishes = json
        .map(
          (dish) => Dish(
              id: dish["idMeal"],
              image: dish["strMealThumb"],
              name: dish["strMeal"]),
        )
        .toList();
  }
}

class Dish {
  final String name;
  final String image;
  final String id;
  String recipee = "";

  Dish({required this.name, required this.image, required this.id});

  Future<void> getDishInfo() async {
    Uri url =
        Uri.parse('https://www.themealdb.com/api/json/v1/1/lookup.php?i=$id');
    Response response = await get(url);
    if (response.statusCode == 200) {
      final Map data = jsonDecode(response.body);
      recipee = data["meals"][0]["strInstructions"];
    }
  }
}
