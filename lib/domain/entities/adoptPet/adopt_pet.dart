import 'package:freezed_annotation/freezed_annotation.dart';

import '../adoptPetData/adopt_pet_data.dart';

part 'adopt_pet.freezed.dart';
part 'adopt_pet.g.dart';


@freezed
class AdoptPet with _$AdoptPet {
    const AdoptPet._();

 const  factory AdoptPet({
    required int count,
    @JsonKey(name: 'entries') required List<AdoptPetData> data,
  }) = _AdoptPet;

  factory AdoptPet.fromJson(Map<String, dynamic> json) =>
      _$AdoptPetFromJson(json);
}
