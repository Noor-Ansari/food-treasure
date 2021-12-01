import "package:flutter/material.dart";

import 'package:provider/provider.dart';
import 'package:fooder/services/service_locator.dart';

import 'package:fooder/ui/widgets/ingredients_list.dart';
import 'package:fooder/ui/widgets/loading.dart';
import 'package:fooder/ui/widgets/hyper_link.dart';

import 'package:fooder/business_logic/view_models/dish_info_view_model.dart';

import 'package:fooder/business_logic/utils/text.dart';
import 'package:fooder/constants/color.dart';

class DishInfo extends StatefulWidget {
  final String dishId;
  const DishInfo({Key? key, required this.dishId}) : super(key: key);

  @override
  State<DishInfo> createState() => _DishInfoState();
}

class _DishInfoState extends State<DishInfo> {
  DishInfoViewModel model = serviceLocator<DishInfoViewModel>();

  @override
  void initState() {
    model.loadData(widget.dishId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<DishInfoViewModel>(
      create: (context) => model,
      child: _ui(),
    );
  }

  Widget _ui() {
    return Consumer<DishInfoViewModel>(
      builder: (context, model, _) => model.loading
          ? const Loading()
          : Scaffold(
              appBar: AppBar(
                iconTheme: const IconThemeData(
                  color: Colors.white,
                ),
                title: Text(
                  model.dishInfo.name,
                  style: const TextStyle(color: Colors.white),
                ),
                centerTitle: true,
                backgroundColor: primaryColor,
              ),
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    Hero(
                      tag: "dish-image-${model.dishInfo.name}",
                      child: Image.network(model.dishInfo.image),
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
                  ],
                ),
              ),
            ),
    );
  }
}
