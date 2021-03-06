import "package:flutter/material.dart";

import 'package:provider/provider.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:food_treasure/ui/widgets/ingredients_list.dart';
import 'package:food_treasure/ui/widgets/loading.dart';
import 'package:food_treasure/ui/widgets/hyper_link.dart';

import 'package:food_treasure/business_logic/view_models/dish_info_view_model.dart';
import 'package:food_treasure/business_logic/view_models/favorite_dishes_view_model.dart';

import 'package:food_treasure/services/service_locator.dart';

import 'package:food_treasure/constants/color.dart';
import 'package:food_treasure/ui/utils/text.dart';

class DishInfo extends StatefulWidget {
  final String name;
  final String image;
  const DishInfo({Key? key, required this.name, required this.image})
      : super(key: key);

  @override
  State<DishInfo> createState() => _DishInfoState();
}

class _DishInfoState extends State<DishInfo> {
  DishInfoViewModel model = serviceLocator<DishInfoViewModel>();

  @override
  void initState() {
    Provider.of<DishInfoViewModel>(context, listen: false)
        .loadData(widget.name);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    DishInfoViewModel model = Provider.of<DishInfoViewModel>(context);
    FavoriteDishesViewModel favModel =
        Provider.of<FavoriteDishesViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        title: Text(
          widget.name,
          style: const TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: primaryColor,
        actions: [
          if (!model.loading)
            model.isFavorite()
                ? GestureDetector(
                    onTap: () => favModel.removeFromFavorites(model.dishInfo),
                    child: const Icon(
                      Icons.favorite,
                      color: Colors.white,
                      size: 32,
                    ),
                  )
                : GestureDetector(
                    onTap: () => favModel.addToFavorites(model.dishInfo),
                    child: const Icon(
                      Icons.favorite_border,
                      color: Colors.white,
                      size: 32,
                    ),
                  ),
          const SizedBox(
            width: 24,
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Hero(
              tag: "dish-image-${widget.name}",
              child: CachedNetworkImage(
                imageUrl: widget.image,
              ),
            ),
            const SizedBox(height: 24.0),
            if (model.loading || model.noData) ...[
              const Loading(atCenter: false)
            ] else ...[
              const Text(
                "Ingredients",
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 24.0),
              IngredientList(
                ingredients: model.dishInfo.ingredients,
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
              ...splitText(model.dishInfo.recipee, context),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 24.0),
                child: HyperLink(
                  text: "Youtube Reference",
                  url: model.dishInfo.videoRef,
                ),
              )
            ]
          ],
        ),
      ),
    );
  }
}
