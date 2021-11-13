import 'dart:convert';
import 'package:flutter/material.dart';
import "package:http/http.dart";
import '../widgets/card.dart';

class Dishes extends StatefulWidget {
  const Dishes(this.categoryName, {Key? key}) : super(key: key);
  final String categoryName;

  @override
  _DishesState createState() => _DishesState();
}

class _DishesState extends State<Dishes> {
  List<Dish> dishes = [];

  @override
  void initState() {
    super.initState();
    getDishes();
  }

  Future getDishes() async {
    Uri url = Uri.parse(
        'https://www.themealdb.com/api/json/v1/1/filter.php?c=${widget.categoryName}');
    Response response = await get(url);
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      setState(() {
        dishes = DishesResponse.fromJSON(data["meals"]).dishes;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.categoryName),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: dishes
                .map(
                  (dish) => CustomCard(
                    cardText: dish.dishName,
                    cardImage: dish.dishImage,
                  ),
                )
                .toList(),
          ),
        ),
      ),
    );
  }
}

class DishesResponse {
  List<Dish> dishes = [];

  DishesResponse.fromJSON(List<dynamic> json) {
    dishes = json
        .map(
          (dish) => Dish(
              dishId: dish["idMeal"],
              dishImage: dish["strMealThumb"],
              dishName: dish["strMeal"]),
        )
        .toList();
  }
}

class Dish {
  final String dishName;
  final String dishImage;
  final String dishId;

  Dish({required this.dishName, required this.dishImage, required this.dishId});
}
