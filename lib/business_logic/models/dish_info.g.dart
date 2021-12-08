// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dish_info.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DishInfoAdapter extends TypeAdapter<DishInfo> {
  @override
  final int typeId = 0;

  @override
  DishInfo read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DishInfo(
      name: fields[0] as String,
      image: fields[1] as String,
      recipee: fields[2] as String,
      videoRef: fields[3] as String,
      ingredients: (fields[4] as List)
          .map((dynamic e) => (e as Map).cast<String, dynamic>())
          .toList(),
    );
  }

  @override
  void write(BinaryWriter writer, DishInfo obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.image)
      ..writeByte(2)
      ..write(obj.recipee)
      ..writeByte(3)
      ..write(obj.videoRef)
      ..writeByte(4)
      ..write(obj.ingredients);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DishInfoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
