import 'package:hive/hive.dart';

import 'adopted_pet_table.dart';
part 'adopted_data_table.g.dart';

@HiveType(typeId: 0)
class AdoptedDataList extends HiveObject {
  @HiveField(0)
  final int count;
  @HiveField(1)
  final List<AdoptedPetData> data;

  AdoptedDataList(this.count, this.data);
}
