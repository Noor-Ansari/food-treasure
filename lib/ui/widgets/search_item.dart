import "package:flutter/material.dart";

import 'package:provider/provider.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:fooder/business_logic/models/dish_info.dart';
import 'package:fooder/business_logic/view_models/custom_search_view_model.dart';

class SearchItem extends StatelessWidget {
  final DishInfo dish;
  final String query;

  const SearchItem({required this.dish, required this.query, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    CustomSearchViewModel model = Provider.of<CustomSearchViewModel>(context);
    return ListTile(
      leading: SizedBox(
        height: 32,
        width: 32,
        child: CachedNetworkImage(
          imageUrl: dish.image,
        ),
      ),
      minLeadingWidth: 12,
      title: RichText(
        text: TextSpan(
          text: dish.name.substring(0, query.length),
          style: const TextStyle(color: Colors.black),
          children: [
            TextSpan(
              text: dish.name.substring(query.length),
              style: const TextStyle(color: Colors.grey),
            )
          ],
        ),
      ),
      onTap: () => model.handleItemSelected(context, dish),
    );
  }
}
