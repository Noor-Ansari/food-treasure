import "package:flutter/material.dart";
import 'package:fooder/models/dish.dart';
import 'package:fooder/widgets/ingredients_list.dart';

class DishInfo extends StatelessWidget {
  final Dish dish;

  const DishInfo({Key? key, required this.dish}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(dish.name), centerTitle: true),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(dish.image),
            const SizedBox(height: 18.0),
            Text(
              dish.name,
              style:
                  const TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
            const Text(
              "Ingredients",
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            IngredientList(
              ingredients: dish.ingredients,
            ),
            const Text(
              "Instructions",
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Text(
                dish.recipee,
                style: const TextStyle(
                  fontSize: 18.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
