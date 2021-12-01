import "package:flutter/material.dart";

import 'package:provider/provider.dart';
import 'package:fooder/services/service_locator.dart';

import 'package:fooder/ui/screens/dishes.dart';
import 'package:fooder/ui/widgets/card.dart';
import 'package:fooder/ui/widgets/loading.dart';

import 'package:fooder/business_logic/view_models/categories_view_model.dart';

import 'package:fooder/constants/color.dart';

class Categories extends StatefulWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  CategoriesViewModel model = serviceLocator<CategoriesViewModel>();

  @override
  void initState() {
    model.loadData();
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
    return ChangeNotifierProvider<CategoriesViewModel>(
      create: (context) => model,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Fooder'),
          centerTitle: true,
          backgroundColor: primaryColor,
        ),
        body: _ui(),
      ),
    );
  }

  Widget _ui() {
    return Consumer<CategoriesViewModel>(
      builder: (context, model, _) => model.loading
          ? const Loading()
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
            ),
    );
  }
}
