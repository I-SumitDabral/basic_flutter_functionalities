// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'adopted_pet_table.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AdoptedPetDataAdapter extends TypeAdapter<AdoptedPetData> {
  @override
  final int typeId = 1;

  @override
  AdoptedPetData read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AdoptedPetData(
      fields[0] as String,
      fields[1] as String,
      fields[2] as String,
      fields[3] as bool,
      fields[4] as String,
      fields[5] as String,
      fields[6] as String,
    );
  }

  @override
  void write(BinaryWriter writer, AdoptedPetData obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.api)
      ..writeByte(1)
      ..write(obj.description)
      ..writeByte(2)
      ..write(obj.auth)
      ..writeByte(3)
      ..write(obj.hTTPS)
      ..writeByte(4)
      ..write(obj.cors)
      ..writeByte(5)
      ..write(obj.link)
      ..writeByte(6)
      ..write(obj.category);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AdoptedPetDataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
