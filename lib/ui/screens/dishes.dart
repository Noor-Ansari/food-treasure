import 'package:flutter/material.dart';
import 'package:fooder/ui/widgets/bottom_navigation.dart';

import 'package:provider/provider.dart';

import 'package:fooder/ui/screens/dish_info.dart';
import 'package:fooder/ui/widgets/card.dart';
import 'package:fooder/ui/widgets/loading.dart';

import 'package:fooder/business_logic/view_models/dishes_view_model.dart';

import 'package:fooder/constants/color.dart';

class Dishes extends StatefulWidget {
  final String categoryName;

  const Dishes(this.categoryName, {Key? key}) : super(key: key);

  @override
  State<Dishes> createState() => _DishesState();
}

class _DishesState extends State<Dishes> {
  @override
  void initState() {
    Provider.of<DishesViewModel>(context, listen: false)
        .loadData(widget.categoryName);
    super.initState();
  }

  void showDishInfo(String name, String image) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DishInfo(name: name, image: image),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    DishesViewModel model = Provider.of<DishesViewModel>(context);
    return Center(
      child: Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(
            color: Colors.white,
          ),
          title: Text(
            widget.categoryName,
            style: const TextStyle(color: Colors.white),
          ),
          centerTitle: true,
          backgroundColor: primaryColor,
        ),
        body: _ui(model),
        bottomNavigationBar: const CustomBottomNavigation(),
      ),
    );
  }

  Widget _ui(DishesViewModel model) {
    return model.loading
        ? const Loading(
            atCenter: true,
          )
        : SingleChildScrollView(
            padding: const EdgeInsets.symmetric(vertical: 30.0),
            child: Center(
              child: Wrap(
                spacing: 16.0,
                runSpacing: 20.0,
                children: model.dishes
                    .map(
                      (dish) => GestureDetector(
                        onTap: () => showDishInfo(dish.name, dish.image),
                        child: CustomCard(
                          cardText: dish.name,
                          cardImage: dish.image,
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
          );
  }
}
