// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'winner_category_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class WinnerCategoryEntityAdapter extends TypeAdapter<WinnerCategoryEntity> {
  @override
  final int typeId = 3;

  @override
  WinnerCategoryEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return WinnerCategoryEntity(
      id: fields[0] as int,
      name: fields[1] as String,
      slug: fields[2] as String,
      description: fields[3] as String,
      status: fields[4] as int,
      iconPath: fields[6] as String?,
      parentId: fields[5] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, WinnerCategoryEntity obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.slug)
      ..writeByte(3)
      ..write(obj.description)
      ..writeByte(4)
      ..write(obj.status)
      ..writeByte(5)
      ..write(obj.parentId)
      ..writeByte(6)
      ..write(obj.iconPath);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WinnerCategoryEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
