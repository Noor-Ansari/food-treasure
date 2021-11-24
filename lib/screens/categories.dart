import "package:flutter/material.dart";

import 'package:fooder/screens/dishes.dart';
import 'package:fooder/widgets/card.dart';
import 'package:fooder/models/category.dart';

class Categories extends StatelessWidget {
  final List<Category> categories;

  const Categories({Key? key, required this.categories}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fooder'),
        centerTitle: true,
        backgroundColor: Colors.amber,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 30.0),
        child: Center(
          child: Wrap(
            spacing: 12.0,
            runSpacing: 12.0,
            children: categories
                .map(
                  (category) => InkWell(
                    onTap: () async {
                      await category.getDishes();
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              Dishes(category.name, dishes: category.dishes),
                        ),
                      );
                    },
                    child: CustomCard(
                      cardText: category.name,
                      cardImage: category.image,
                    ),
                  ),
                )
                .toList(),
          ),
        ),
      ),
    );
  }
}
