import 'package:hive/hive.dart';
part 'adopted_pet_table.g.dart';

@HiveType(typeId: 1)
class AdoptedPetData extends HiveObject{
  @HiveField(0)
  final  String  api;
    @HiveField(1)
      final  String  description;

 @HiveField(2)
      final  String  auth;
 @HiveField(3)
      final  bool  hTTPS;
 @HiveField(4)
      final  String  cors;
 @HiveField(5)
      final  String  link;
 @HiveField(6)
      final  String  category;

  AdoptedPetData(this.api, this.description, this.auth, this.hTTPS, this.cors, this.link, this.category);


}
