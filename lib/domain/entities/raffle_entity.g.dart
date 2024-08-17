// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'raffle_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class RaffleEntityAdapter extends TypeAdapter<RaffleEntity> {
  @override
  final int typeId = 2;

  @override
  RaffleEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return RaffleEntity(
      id: fields[0] as int,
      categoryId: fields[1] as int,
      brandId: fields[2] as int,
      adminId: fields[3] as int,
      name: fields[4] as String,
      slug: fields[5] as String,
      description: fields[6] as String,
      capacity: fields[7] as int,
      mainImage: fields[8] as String,
      image: (fields[9] as List).cast<String>(),
      price: fields[10] as double,
      status: fields[11] as String,
      deadline: fields[12] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, RaffleEntity obj) {
    writer
      ..writeByte(13)
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
      ..write(obj.mainImage)
      ..writeByte(9)
      ..write(obj.image)
      ..writeByte(10)
      ..write(obj.price)
      ..writeByte(11)
      ..write(obj.status)
      ..writeByte(12)
      ..write(obj.deadline);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RaffleEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
