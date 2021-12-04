import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

import 'package:fooder/ui/screens/categories.dart';
import 'package:fooder/ui/utils/search_delgate.dart';

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
    }
    notifyListeners();
  }
}
