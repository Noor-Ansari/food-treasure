import "package:flutter/material.dart";

class IngredientList extends StatelessWidget {
  final List<Map<String, dynamic>> ingredients;

  const IngredientList({Key? key, required this.ingredients}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: ingredients.length,
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          leading: const Icon(Icons.arrow_forward_ios),
          title: Text(
            '${ingredients[index]["name"]}'.toUpperCase(),
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          trailing: Text(
            '${ingredients[index]["value"]}',
            style: const TextStyle(color: Colors.green, fontSize: 15),
          ),
          minLeadingWidth: 4.0,
        );
      },
    );
  }
}
