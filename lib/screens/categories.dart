import "package:flutter/material.dart";

import 'package:fooder/screens/dishes.dart';
import 'package:fooder/widgets/card.dart';

import 'package:fooder/constants/color.dart';
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
        backgroundColor: primaryColor,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          vertical: categories.isEmpty
              ? MediaQuery.of(context).size.height * 0.4
              : 30,
        ),
        child: Center(
          child: categories.isEmpty
              ? const Text(
                  "No Data Found",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: primaryColor,
                  ),
                )
              : Wrap(
                  spacing: 12.0,
                  runSpacing: 12.0,
                  children: categories
                      .map(
                        (category) => InkWell(
                          onTap: () async {
                            if (category.dishes.isEmpty) {
                              await category.getDishes();
                            }
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Dishes(category.name,
                                    dishes: category.dishes),
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
