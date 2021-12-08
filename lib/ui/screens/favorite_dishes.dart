import 'package:flutter/material.dart';

import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';

import 'package:fooder/ui/screens/dish_info.dart' as ui;
import 'package:fooder/ui/widgets/bottom_navigation.dart';

import 'package:fooder/business_logic/models/dish_info.dart';
import 'package:fooder/business_logic/view_models/favorite_dishes_view_model.dart';

import 'package:fooder/constants/color.dart';

class FavoriteDishes extends StatefulWidget {
  const FavoriteDishes({Key? key}) : super(key: key);

  @override
  _FavoriteDishesState createState() => _FavoriteDishesState();
}

class _FavoriteDishesState extends State<FavoriteDishes> {
  @override
  void initState() {
    Provider.of<FavoriteDishesViewModel>(context, listen: false).loadData();
    super.initState();
  }

  void showDishInfo(DishInfo dish) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ui.DishInfo(name: dish.name, image: dish.image),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    FavoriteDishesViewModel model =
        Provider.of<FavoriteDishesViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Favorite Dishes",
        ),
        centerTitle: true,
        backgroundColor: primaryColor,
      ),
      body: model.favoriteDishes.isEmpty
          ? const Center(
              child: Text(
                "You haven't added any dish",
                style: TextStyle(color: primaryColor, fontSize: 24),
              ),
            )
          : ListView.builder(
              itemBuilder: (context, index) {
                DishInfo dish = model.favoriteDishes[index];
                return Container(
                  margin: const EdgeInsets.all(8.0),
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(width: 2.0, color: secondaryColor),
                    boxShadow: const [
                      BoxShadow(
                        color: Color.fromRGBO(51, 45, 45, 0.1),
                        blurRadius: 2,
                        offset: Offset(4, 4),
                      ),
                    ],
                  ),
                  child: Slidable(
                    endActionPane: ActionPane(
                      children: [
                        SlidableAction(
                          onPressed: (context) =>
                              model.removeFromFavorites(dish),
                          backgroundColor: const Color(0xFFFE4A49),
                          foregroundColor: Colors.white,
                          icon: Icons.delete,
                          label: 'Delete',
                          spacing: 10,
                        ),
                      ],
                      motion: const ScrollMotion(),
                    ),
                    child: ListTile(
                      onTap: () => showDishInfo(dish),
                      title: Text(dish.name),
                      leading: SizedBox(
                        height: 32,
                        width: 32,
                        child: Image.network(dish.image),
                      ),
                    ),
                  ),
                );
              },
              itemCount: model.favoriteDishes.length,
            ),
      bottomNavigationBar: const CustomBottomNavigation(),
    );
  }
}
