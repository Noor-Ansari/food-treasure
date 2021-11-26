import "package:flutter/material.dart";

import 'package:fooder/models/dish.dart';
import 'package:fooder/widgets/hyper_link.dart';
import 'package:fooder/widgets/ingredients_list.dart';

import 'package:fooder/constants/color.dart';
import 'package:fooder/helpers/text.dart';

class DishInfo extends StatelessWidget {
  final Dish dish;

  const DishInfo({Key? key, required this.dish}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        title: Text(
          dish.name,
          style: const TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: primaryColor,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Hero(
              tag: "dish-image-${dish.name}",
              child: Image.network(dish.image),
            ),
            const SizedBox(height: 24.0),
            const Text(
              "Ingredients",
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 24.0),
            IngredientList(
              ingredients: dish.ingredients,
            ),
            const SizedBox(height: 24.0),
            const Text(
              "Instructions",
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            ...splitText(dish.recipee, context),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 24.0),
              child: HyperLink(
                text: "Youtube Reference",
                url: dish.videoRef,
              ),
            )
          ],
        ),
      ),
    );
  }
}
