import 'package:flutter/material.dart';

import 'package:fooder/widgets/card.dart';
import "package:fooder/screens/dish_info.dart";

import 'package:fooder/constants/color.dart';
import "package:fooder/models/dish.dart";

class Dishes extends StatelessWidget {
  final String categoryName;
  final List<Dish> dishes;

  const Dishes(this.categoryName, {required this.dishes, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(
            color: Colors.white,
          ),
          title: Text(
            categoryName,
            style: const TextStyle(color: Colors.white),
          ),
          centerTitle: true,
          backgroundColor: primaryColor,
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: 30.0),
          child: Center(
            child: Wrap(
              spacing: 16.0,
              runSpacing: 20.0,
              children: dishes
                  .map(
                    (dish) => GestureDetector(
                      onTap: () async {
                        if (dish.recipee == "") {
                          await dish.getDishInfo();
                        }
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DishInfo(
                                dish: dish,
                              ),
                            ));
                      },
                      child: CustomCard(
                        cardText: dish.name,
                        cardImage: dish.image,
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
        ),
      ),
    );
  }
}
