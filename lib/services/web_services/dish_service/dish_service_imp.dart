import 'dart:convert';
import "package:http/http.dart";

import 'package:fooder/business_logic/models/dish.dart';
import 'package:fooder/business_logic/models/dish_info.dart';

import 'package:fooder/services/web_services/dish_service/dish_service.dart';

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
  Future<DishInfo> fetchDishInfo(String dishId) async {
    try {
      Uri url = Uri.parse(
          'https://www.themealdb.com/api/json/v1/1/lookup.php?i=$dishId');
      Response response = await get(url);
      if (response.statusCode == 200) {
        final Map data = jsonDecode(response.body);
        String name = data["meals"][0]["strMeal"];
        String image = data["meals"][0]["strMealThumb"];
        String recipee = data["meals"][0]["strInstructions"];
        String videoRef = data["meals"][0]["strYoutube"];

        List<Map<String, String>> ingredients = [];
        int index = 0;
        data["meals"][0].forEach((key, value) {
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
        return DishInfo(
            name: name,
            image: image,
            recipee: recipee,
            videoRef: videoRef,
            ingredients: ingredients);
      } else {
        return DishInfo(
            name: "", image: "", recipee: "", videoRef: "", ingredients: []);
      }
    } catch (e) {
      return DishInfo(
          name: "", image: "", recipee: "", videoRef: "", ingredients: []);
    }
  }
}