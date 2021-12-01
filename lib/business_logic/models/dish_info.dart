class DishInfo {
  final String name;
  final String image;
  final String recipee;
  final String videoRef;
  final List<Map<String, dynamic>> ingredients;

  DishInfo(
      {required this.name,
      required this.image,
      required this.recipee,
      required this.videoRef,
      required this.ingredients});
}
