import 'package:hive/hive.dart';

part "dish_info.g.dart";

@HiveType(typeId: 0)
class DishInfo {
  @HiveField(0)
  String name = "";
  @HiveField(1)
  String image = "";
  @HiveField(2)
  String recipee = "";
  @HiveField(3)
  String videoRef = "";
  @HiveField(4)
  List<Map<String, dynamic>> ingredients = [];

  DishInfo(
      {required this.name,
      required this.image,
      required this.recipee,
      required this.videoRef,
      required this.ingredients});

  DishInfo.empty();
}
