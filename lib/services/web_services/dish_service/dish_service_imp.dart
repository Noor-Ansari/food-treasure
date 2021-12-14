import 'dart:convert';
import "package:http/http.dart";

import 'package:food_treasure/business_logic/models/dish.dart';
import 'package:food_treasure/business_logic/models/dish_info.dart';

import 'package:food_treasure/services/web_services/dish_service/dish_service.dart';

class DishServiceImp implements DishService {
  @override
  Future<List<Dish>> fetchDishes(String categoryName) async {
    try {
      Uri url = Uri.parse(
          'https://www.themealdb.com/api/json/v1/1/filter.php?c=$categoryName');
      Response response = await get(url);
      if (response.statusCode == 200) {
        final Map data = jsonDecode(response.body);
        List<Dish> dishes = data["meals"]
            .map<Dish>(
              (dish) => Dish(
                  id: dish["idMeal"],
                  image: dish["strMealThumb"],
                  name: dish["strMeal"]),
            )
            .toList();
        return dishes;
      } else {
        return <Dish>[];
      }
    } catch (e) {
      return <Dish>[];
    }
  }

  @override
  Future<List<DishInfo>> fetchDishInfo(String dishName) async {
    try {
      Uri url = Uri.parse(
          'https://www.themealdb.com/api/json/v1/1/search.php?s=$dishName');
      Response response = await get(url);
      if (response.statusCode == 200) {
        final Map data = jsonDecode(response.body);
        List<DishInfo> dishes = [];

        for (var item in data["meals"]) {
          String recipee = item["strInstructions"];
          String videoRef = item["strYoutube"];
          String name = item["strMeal"];
          String image = item["strMealThumb"];

          List<Map<String, String>> ingredients = [];
          int index = 0;
          item.forEach((key, value) {
            if (key.toString().startsWith("strIngredient") &&
                value != null &&
                value != "") {
              ingredients.add({"name": value});
            } else if (key.toString().startsWith("strMeasure") &&
                value != null &&
                value != "" &&
                ingredients.length > index) {
              ingredients[index]["value"] = value;
              index++;
            }
          });
          dishes.add(DishInfo(
              name: name,
              image: image,
              recipee: recipee,
              videoRef: videoRef,
              ingredients: ingredients));
        }
        return dishes;
      } else {
        return [DishInfo.empty()];
      }
    } catch (e) {
      return [DishInfo.empty()];
    }
  }
}
