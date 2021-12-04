class DishInfo {
  String name = "";
  String image = "";
  String recipee = "";
  String videoRef = "";
  List<Map<String, dynamic>> ingredients = [];

  DishInfo(
      {required this.name,
      required this.image,
      required this.recipee,
      required this.videoRef,
      required this.ingredients});

  DishInfo.empty();
}
