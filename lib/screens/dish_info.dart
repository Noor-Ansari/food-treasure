import 'package:flutter/gestures.dart';
import "package:flutter/material.dart";
import 'package:fooder/models/dish.dart';
import 'package:fooder/widgets/ingredients_list.dart';

class DishInfo extends StatelessWidget {
  final Dish dish;

  const DishInfo({Key? key, required this.dish}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white, //change your color here
        ),
        title: Text(
          dish.name,
          style: const TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromRGBO(223, 123, 11, 1),
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
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Text(
                dish.recipee,
                style: const TextStyle(
                  fontSize: 18.0,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 24.0),
              child: RichText(
                text: TextSpan(
                  text: 'Youtube Reference',
                  style: const TextStyle(color: Colors.blue),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      launch(
                          'https://docs.flutter.io/flutter/services/UrlLauncher-class.html');
                    },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void launch(String s) {}
}
