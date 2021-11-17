import "package:flutter/material.dart";
import 'package:fooder/models/dish.dart';

class DishInfo extends StatelessWidget {
  const DishInfo({Key? key, required this.dish}) : super(key: key);
  final Dish dish;

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
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Text(
                dish.recipee,
                style: const TextStyle(
                  fontSize: 18.0,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
