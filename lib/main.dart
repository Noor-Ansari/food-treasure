import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:fooder/ui/screens/loader.dart';

import 'package:fooder/business_logic/view_models/custom_search_view_model.dart';
import 'package:fooder/business_logic/view_models/categories_view_model.dart';
import 'package:fooder/business_logic/view_models/dish_info_view_model.dart';
import 'package:fooder/business_logic/view_models/dishes_view_model.dart';
import 'package:fooder/business_logic/view_models/bottom_navbar_view_model.dart';

import 'package:fooder/services/service_locator.dart';

void main() {
  setup();
  CategoriesViewModel categoriesViewModel =
      serviceLocator<CategoriesViewModel>();
  DishesViewModel dishesViewModel = serviceLocator<DishesViewModel>();
  DishInfoViewModel dishInfoViewModel = serviceLocator<DishInfoViewModel>();
  BottomNabarViewModel bottomNavbarViewModel =
      serviceLocator<BottomNabarViewModel>();
  CustomSearchViewModel customSearchViewModel =
      serviceLocator<CustomSearchViewModel>();

  return runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<CategoriesViewModel>(
          create: (context) => categoriesViewModel,
        ),
        ChangeNotifierProvider<DishesViewModel>(
          create: (context) => dishesViewModel,
        ),
        ChangeNotifierProvider<DishInfoViewModel>(
          create: (context) => dishInfoViewModel,
        ),
        ChangeNotifierProvider<BottomNabarViewModel>(
          create: (context) => bottomNavbarViewModel,
        ),
        ChangeNotifierProvider<CustomSearchViewModel>(
          create: (context) => customSearchViewModel,
        )
      ],
      child: const MaterialApp(
        title: "Food Treasure",
        home: Loader(),
      ),
    ),
  );
}
