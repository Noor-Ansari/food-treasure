import "package:flutter/material.dart";

class IngredientList extends StatelessWidget {
  final List<Map<String, dynamic>> ingredients;

  const IngredientList({Key? key, required this.ingredients}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ...ingredients
            .map(
              (ingredient) => Text(
                '${ingredient["name"]} : ${ingredient["value"]}',
                style: const TextStyle(fontSize: 18.0),
              ),
            )
            .toList(),
      ],
    );
  }
}
