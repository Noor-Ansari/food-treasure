import "package:flutter/material.dart";
import 'package:http/http.dart' as http;
import '../screens/dishes.dart';
import 'card.dart';
import 'dart:convert';

class Categories extends StatefulWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  List<Category> categories = [];

  Future fetchData() async {
    Uri url =
        Uri.parse("https://www.themealdb.com/api/json/v1/1/categories.php");
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      setState(() {
        categories = CategoriesResponse.fromJSON(data["categories"]).categories;
      });
    }
  }

  @override
  void initState() {
    fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: categories
            .map(
              (category) => InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Dishes(category.strCategory),
                    ),
                  );
                },
                child: CustomCard(
                  cardText: category.strCategory,
                  cardImage: category.strCategoryThumb,
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}

class CategoriesResponse {
  final List<Category> categories;

  CategoriesResponse({required this.categories});

  CategoriesResponse.fromJSON(List<dynamic> json)
      : categories = json
            .map(
              (item) => Category(
                  idCategory: item["idCategory"],
                  strCategory: item["strCategory"],
                  strCategoryDescription: item["strCategoryDescription"],
                  strCategoryThumb: item["strCategoryThumb"]),
            )
            .toList();
}

class Category {
  final String idCategory;
  final String strCategory;
  final String strCategoryThumb;
  final String strCategoryDescription;

  Category(
      {required this.idCategory,
      required this.strCategory,
      required this.strCategoryDescription,
      required this.strCategoryThumb});
}
