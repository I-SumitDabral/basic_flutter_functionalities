// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'adopted_data_table.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AdoptedDataListAdapter extends TypeAdapter<AdoptedDataList> {
  @override
  final int typeId = 0;

  @override
  AdoptedDataList read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AdoptedDataList(
      fields[0] as int,
      (fields[1] as List).cast<AdoptedPetData>(),
    );
  }

  @override
  void write(BinaryWriter writer, AdoptedDataList obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.count)
      ..writeByte(1)
      ..write(obj.data);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AdoptedDataListAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
