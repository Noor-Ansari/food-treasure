import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

import 'package:food_treasure/ui/screens/categories.dart';
import 'package:food_treasure/ui/screens/favorite_dishes.dart';
import 'package:food_treasure/ui/utils/search_delgate.dart';

class BottomNabarViewModel extends ChangeNotifier {
  int _index = 0;

  int get index => _index;

  void handleChange(int newIndex, {required BuildContext context}) {
    if (newIndex == _index) return;
    switch (newIndex) {
      case 0:
        _index = newIndex;
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const Categories(),
          ),
        );
        break;
      case 1:
        showSearch(
            context: context,
            delegate:
                CustomSearch(placeholder: "Search your favorite dishes..."));
        break;
      case 2:
        _index = newIndex;
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => const FavoriteDishes(),
            ),
            (Route<dynamic> route) => false);
        break;
    }
    notifyListeners();
  }
}
