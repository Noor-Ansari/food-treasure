class DishInfo {
  String recipee = "";
  String videoRef = "";
  List<Map<String, dynamic>> ingredients = [];

  DishInfo(
      {required this.recipee,
      required this.videoRef,
      required this.ingredients});

  DishInfo.empty();
}
