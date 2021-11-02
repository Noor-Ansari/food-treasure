import "package:flutter/material.dart";
import 'package:http/http.dart' as http;
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
              (category) => Container(
                margin: const EdgeInsets.all(20.0),
                padding: const EdgeInsets.all(5.0),
                height: 200.0,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.blueAccent),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(10.0),
                  ),
                ),
                child: Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Image.network(
                        category.strCategoryThumb,
                        fit: BoxFit.fitWidth,
                        height: 150.0,
                      ),
                    ),
                    const SizedBox(width: 10.0),
                    Expanded(
                      child: Text(
                        category.strCategory,
                        style: TextStyle(
                          color: Colors.amberAccent[400],
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                  ],
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
