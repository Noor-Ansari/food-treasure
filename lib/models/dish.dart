import "package:http/http.dart";
import "dart:convert";

class Dish {
  final String name;
  final String image;
  final String id;
  String recipee = "";
  List<Map<String, dynamic>> ingredients = [];

  Dish({required this.name, required this.image, required this.id});

  Future<void> getDishInfo() async {
    Uri url =
        Uri.parse('https://www.themealdb.com/api/json/v1/1/lookup.php?i=$id');
    Response response = await get(url);
    if (response.statusCode == 200) {
      final Map data = jsonDecode(response.body);
      recipee = data["meals"][0]["strInstructions"];
      List<Map<String, String>> temp = [];
      int index = 0;
      data["meals"][0].forEach((key, value) {
        if (key.toString().startsWith("strIngredient") &&
            value != null &&
            value != "") {
          temp.add({"name": value});
        } else if (key.toString().startsWith("strMeasure") &&
            value != null &&
            value != "" &&
            temp.length > index) {
          temp[index]["value"] = value;
          index++;
        }
      });
      ingredients = temp;
    }
  }
}
