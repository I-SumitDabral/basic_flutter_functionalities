import 'package:hive/hive.dart';
import 'package:raftlabs_assignment/data/core/tables/adopted_pet_table.dart';

class DataAdapter extends TypeAdapter<AdoptedPetData> {
  @override
  AdoptedPetData read(BinaryReader reader) {
    // TODO: implement read
    throw UnimplementedError();
  }

  @override
  // TODO: implement typeId
  int get typeId => throw UnimplementedError();

  @override
  void write(BinaryWriter writer, AdoptedPetData obj) {
    // TODO: implement write
  }
}
