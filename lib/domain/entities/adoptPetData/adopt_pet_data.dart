import 'package:freezed_annotation/freezed_annotation.dart';

part 'adopt_pet_data.freezed.dart';
part 'adopt_pet_data.g.dart';

@freezed
class AdoptPetData with _$AdoptPetData {
      const AdoptPetData._();

 const  factory AdoptPetData({
    @JsonKey(name: "API") required String api,
    @JsonKey(name: "Description") required String description,
    @JsonKey(name: "Auth") required String auth,
    @JsonKey(name: "HTTPS")required bool hTTPS,
    @JsonKey(name: "Cors") required String cors,
    @JsonKey(name: "Link") required String link,
    @JsonKey(name: "Category")required  String category,
  }) = _AdoptPetData;

  factory AdoptPetData.fromJson(Map<String, dynamic> json) =>
      _$AdoptPetDataFromJson(json);
}
