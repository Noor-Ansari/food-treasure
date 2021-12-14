import "package:flutter/material.dart";

import "package:provider/provider.dart";

import 'package:food_treasure/business_logic/view_models/bottom_navbar_view_model.dart';

class CustomBottomNavigation extends StatelessWidget {
  const CustomBottomNavigation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BottomNabarViewModel model = Provider.of<BottomNabarViewModel>(context);
    return BottomNavigationBar(
      currentIndex: model.index,
      onTap: (index) => model.handleChange(index, context: context),
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home_outlined),
          label: "Home",
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.search_outlined,
          ),
          label: "Search",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite_outline),
          label: "Favorite",
        )
      ],
    );
  }
}
