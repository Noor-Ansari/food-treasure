import "package:flutter/material.dart";

import 'package:fooder/constants/color.dart';

class IngredientList extends StatelessWidget {
  final List<Map<String, dynamic>> ingredients;

  const IngredientList({Key? key, required this.ingredients}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ...ingredients.map(
          (ingredient) {
            return ListTile(
              dense: true,
              leading: const Padding(
                padding: EdgeInsets.only(top: 2.0),
                child: Icon(
                  Icons.circle,
                  size: 12.0,
                  color: primaryColor,
                ),
              ),
              title: Text(
                '${ingredient["name"]}'.toUpperCase(),
                style:
                    const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
              trailing: Text(
                '${ingredient["value"]}',
                style: const TextStyle(
                  color: primaryColor,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              minLeadingWidth: 4.0,
            );
          },
        )
      ],
    );
  }
}
