// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'raffle_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class RaffleModelAdapter extends TypeAdapter<RaffleModel> {
  @override
  final int typeId = 2;

  @override
  RaffleModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return RaffleModel(
      id: fields[0] as int,
      categoryId: fields[1] as int,
      brandId: fields[2] as int,
      adminId: fields[3] as int,
      name: fields[4] as String,
      slug: fields[5] as String,
      description: fields[6] as String,
      capacity: fields[7] as int,
      images: (fields[8] as List).cast<String>(),
      price: fields[9] as double,
      status: fields[10] as String,
      deadline: fields[11] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, RaffleModel obj) {
    writer
      ..writeByte(12)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.categoryId)
      ..writeByte(2)
      ..write(obj.brandId)
      ..writeByte(3)
      ..write(obj.adminId)
      ..writeByte(4)
      ..write(obj.name)
      ..writeByte(5)
      ..write(obj.slug)
      ..writeByte(6)
      ..write(obj.description)
      ..writeByte(7)
      ..write(obj.capacity)
      ..writeByte(8)
      ..write(obj.images)
      ..writeByte(9)
      ..write(obj.price)
      ..writeByte(10)
      ..write(obj.status)
      ..writeByte(11)
      ..write(obj.deadline);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RaffleModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
