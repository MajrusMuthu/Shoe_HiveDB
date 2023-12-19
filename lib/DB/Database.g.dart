// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Database.dart';
// import 'package:shoeproject_hive/DB/Database.g.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ShoeCardAdapter extends TypeAdapter<ShoeCard> {
  @override
  final int typeId = 0;

  @override
  ShoeCard read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ShoeCard(
      shoe_name: fields[2] as String?,
      description: fields[3] as String?,
      Price: fields[4] as String?,
      discount: fields[5] as String?,
      final_price: fields[6] as String?,
      image_url: fields[7] as String?,
    )..id = fields[1] as int;
  }

  @override
  void write(BinaryWriter writer, ShoeCard obj) {
    writer
      ..writeByte(7)
      ..writeByte(1)
      ..write(obj.id)
      ..writeByte(2)
      ..write(obj.shoe_name)
      ..writeByte(3)
      ..write(obj.description)
      ..writeByte(4)
      ..write(obj.Price)
      ..writeByte(5)
      ..write(obj.discount)
      ..writeByte(6)
      ..write(obj.final_price)
      ..writeByte(7)
      ..write(obj.image_url);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ShoeCardAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
