import "package:flutter/material.dart";
import 'package:food_treasure/ui/widgets/bottom_navigation.dart';

import 'package:provider/provider.dart';

import 'package:food_treasure/business_logic/view_models/categories_view_model.dart';

import 'package:food_treasure/ui/screens/dishes.dart';
import 'package:food_treasure/ui/widgets/card.dart';
import 'package:food_treasure/ui/widgets/loading.dart';

import 'package:food_treasure/constants/color.dart';

class Categories extends StatefulWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  @override
  void initState() {
    Provider.of<CategoriesViewModel>(context, listen: false).loadData();
    super.initState();
  }

  void showDishes(String categoryName) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Dishes(categoryName),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    CategoriesViewModel model = Provider.of<CategoriesViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Fooder'),
        centerTitle: true,
        backgroundColor: primaryColor,
      ),
      body: _ui(model),
      bottomNavigationBar: const CustomBottomNavigation(),
    );
  }

  Widget _ui(CategoriesViewModel model) {
    return model.loading
        ? const Loading(
            atCenter: true,
          )
        : SingleChildScrollView(
            padding: const EdgeInsets.symmetric(
              vertical: 30,
            ),
            child: Center(
              child: Wrap(
                spacing: 12.0,
                runSpacing: 12.0,
                children: model.categories
                    .map(
                      (category) => InkWell(
                        onTap: () => showDishes(category.name),
                        child: CustomCard(
                          cardText: category.name,
                          cardImage: category.image,
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
          );
  }
}
